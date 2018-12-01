//
//  ViewController.swift
//  doit_day13_Audio
//
//  Created by Sungho Choi on 31/10/2018.
//  Copyright © 2018 Sungho Choi. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController , AVAudioPlayerDelegate{

    var audioPlayer: AVAudioPlayer!
    var audioFile : URL!
    let MAX_VOLUME : Float = 10.0
    var progressTimer : Timer!
    
    
    
    @IBOutlet var pvProgressPlay: UIProgressView!
    
    @IBOutlet var lblCurrentTime: UILabel!
    @IBOutlet var lblEndTime: UILabel!
    
    @IBOutlet var btnPlay: UIButton!
    @IBOutlet var btnPause: UIButton!
    @IBOutlet var btnStop: UIButton!
    
    @IBOutlet var slVolume: UISlider!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        audioFile = Bundle.main.url(forResource:"sicilian_Breeze",withExtension:"mp3")
        
        initPlay()
    }
    
    func initPlay(){
        do{
            audioPlayer = try AVAudioPlayer(contentsOf : audioFile)
        }catch let error as NSError{
            print("Error-initPlay : \(error)")
        }
        
        slVolume.maximumValue = MAX_VOLUME
        slVolume.value = 1.0
        pvProgressPlay.progress = 0;
        
        audioPlayer.delegate = self;
        audioPlayer.prepareToPlay()
        audioPlayer.volume = slVolume.value
        lblEndTime.text =
    }
    @IBAction func btnPlayAudio(_ sender: UIButton) {
    
    }
    @IBAction func btnPauseAudio(_ sender: UIButton) {
    
    }
    @IBAction func btnStopAudio(_ sender: UIButton) {
    
    }
    @IBAction func slChangeVolume(_ sender: UISlider) {
        
    }
    
}

