//
//  ViewController.swift
//  doit_day13_Audio
//
//  Created by Sungho Choi on 31/10/2018.
//  Copyright © 2018 Sungho Choi. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController , AVAudioPlayerDelegate , AVAudioRecorderDelegate {

    var audioPlayer: AVAudioPlayer!
    var audioFile : URL!
    let MAX_VOLUME : Float = 10.0
    var progressTimer : Timer!
    let timePlayerSelector:Selector = #selector(ViewController.updatePlayTime)
    let timeRecordSelector:Selector = #selector(ViewController.updateRecordTime)
    
    //녹음관련
    var audioRecorder : AVAudioRecorder!
    var isRecordMode = false
    
    @IBOutlet weak var pvProgressView: UIProgressView!
    
    @IBOutlet var lblCurrentTime: UILabel!
    @IBOutlet var lblEndTime: UILabel!
    
    @IBOutlet var btnPlay: UIButton!
    @IBOutlet var btnPause: UIButton!
    @IBOutlet var btnStop: UIButton!
    
    @IBOutlet var slVolume: UISlider!
    
    @IBOutlet var btnRecord: UIButton!
    @IBOutlet var lblRecordTime: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        selectAudioFile()
        //초기화
        initPlay()
    }
    func selectAudioFile(){
        if !isRecordMode{
            //local audio file
            audioFile = Bundle.main.url(forResource:"Sicilian_Breeze",withExtension:"mp3")
            
        }else{
            let documentDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0]
            audioFile = documentDirectory.appendingPathComponent("recordFile.m4a")
        }
    }
    
    func initPlay(){
        //오디오 플레이어 초기화.
        do{
            audioPlayer = try AVAudioPlayer(contentsOf: audioFile!)
        }catch let error as NSError{
            print("Error-initPlay : \(error)")
        }
        //볼륨 슬라이더 최대값 설정.
        slVolume.maximumValue = MAX_VOLUME
        //default 볼륨 설정.
        slVolume.value = 1.0
        //재생 시간 프로그레스 최기화.
        pvProgressView.progress = 0
        //
        audioPlayer.delegate = self
        audioPlayer.prepareToPlay()
        audioPlayer.volume = slVolume.value
        lblEndTime.text = convertNSTimeInterval2Strin(audioPlayer.duration)
        lblCurrentTime.text = convertNSTimeInterval2Strin(0)
        btnPlay.isEnabled = true
        btnPause.isEnabled = false
        btnStop.isEnabled = false
        setPlayButtons(true, pause: false, stop: false)
    }
    func setPlayButtons(_ play:Bool, pause:Bool, stop:Bool){
        btnPlay.isEnabled = play
        btnPause.isEnabled = pause
        btnStop.isEnabled = stop
    }
    //timeInterval을 받아
    func convertNSTimeInterval2Strin(_ time: TimeInterval) -> String {
        let min = Int(time/60)
        let sec = Int(time.truncatingRemainder(dividingBy:60))
        let strTime = String (format :"%02d:%02d",min,sec)
        return strTime
    }
    func audioPlayerDidFinishPlaying(_ player: AVAudioPlayer, successfully flag: Bool) {
        progressTimer.invalidate()
        setPlayButtons(true, pause: false, stop: false)
    }
    
    func initRecord(){
        let recordSettings = [
            AVFormatIDKey : NSNumber(value: kAudioFormatAppleLossless as UInt32),
            AVEncoderAudioQualityKey : AVAudioQuality.max.rawValue,
            AVEncoderBitRateKey : 320000,
            AVNumberOfChannelsKey: 2,
        AVSampleRateKey : 44100.0] as [String :Any]
        
        do{
            audioRecorder = try AVAudioRecorder(url: audioFile, settings: recordSettings)
        }catch let error as NSError{
            print("Error init-Record : \(error)")
        }
        audioRecorder.delegate = self
        audioRecorder.isMeteringEnabled = true
        audioRecorder.prepareToRecord()
        
        slVolume.value = 1.0
        audioPlayer.volume = slVolume.value
        lblEndTime.text = convertNSTimeInterval2Strin(0)
        lblCurrentTime.text = convertNSTimeInterval2Strin(0)
        setPlayButtons(false, pause: false, stop: false)
        
        //인스턴스session생성
        let session = AVAudioSession.sharedInstance()
        do{
            //try session.setCategory(AVAudioSession.Category.playAndRecord)
            try AVAudioSession.sharedInstance().setCategory(.playback, mode: .default)
            try AVAudioSession.sharedInstance().setActive(true)
        }catch let error as NSError {
            print("Error-setCategory : \(error)")
        }
        
        do {
            try session.setActive(true)
        } catch let error as NSError {
            print(" Error-setActive : \(error)")
        }
        
    }
    
    @IBAction func btnPlayAudio(_ sender: UIButton) {
        audioPlayer.play()
        setPlayButtons(false, pause: true, stop: true)
        progressTimer = Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: timePlayerSelector, userInfo: nil, repeats: true)
    }
    @IBAction func btnPauseAudio(_ sender: UIButton) {
        audioPlayer.pause()
        setPlayButtons(true, pause: false, stop: true)
    }
    @IBAction func btnStopAudio(_ sender: UIButton) {
        audioPlayer.stop()
        audioPlayer.currentTime = 0
        lblCurrentTime.text = convertNSTimeInterval2Strin(0)
        setPlayButtons(true, pause: false, stop: false)
        progressTimer.invalidate()
        pvProgressView.progress = 0
    }
    @IBAction func slChangeVolume(_ sender: UISlider) {
        audioPlayer.setVolume(slVolume.value, fadeDuration: 1.0)
    }
    @objc func updatePlayTime(){
        lblCurrentTime.text = convertNSTimeInterval2Strin(audioPlayer.currentTime)
        pvProgressView.progress = Float(audioPlayer.currentTime/audioPlayer.duration)
    }
   
    @IBAction func swRecordMode(_ sender: UISwitch) {
        if sender.isOn{
            audioPlayer.stop()
            audioPlayer.currentTime = 0
            lblCurrentTime!.text = convertNSTimeInterval2Strin(0)
            isRecordMode = true
            btnRecord.isEnabled = true
            lblRecordTime.isEnabled = true
            
        }else{
            isRecordMode = false
            btnRecord.isEnabled = false
            lblRecordTime.isEnabled = false
            lblRecordTime.text = convertNSTimeInterval2Strin(0)
        }
        selectAudioFile()
        if !isRecordMode{
            initPlay()
        }else{
            initRecord()
        }
    }
    
    @IBAction func btnRecord(_ sender: UIButton) {
        
        
        if (sender as AnyObject).titleLabel?.text == "Record" {
            audioRecorder.record()
            (sender as AnyObject).setTitle("Stop", for: UIControl.State())
            progressTimer = Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: timeRecordSelector, userInfo: nil, repeats: true)
        } else {
            audioRecorder.stop()
            progressTimer.invalidate()
            (sender as AnyObject).setTitle("Record", for: UIControl.State())
            btnPlay.isEnabled = true
            initPlay()
        }
    }
    @objc func updateRecordTime(){
        lblRecordTime.text = convertNSTimeInterval2Strin(audioRecorder.currentTime)
    }
    
    
    
}

