//
//  ViewController.swift
//  doit_day14_MoviePlayer
//
//  Created by Sungho Choi on 21/11/2018.
//  Copyright © 2018 Sungho Choi. All rights reserved.
//

import UIKit
import AVKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    @IBAction func btnPlayInternalMovie(_ sender: UIButton) {
        let filePath:String? = Bundle.main.path(forResource: "FastTyping", ofType: "mp4")
        let url = NSURL(fileURLWithPath: filePath!)
//        let playerControll = AVPlayerViewController()
//        let player = AVPlayer(url : url as URL)
//        playerControll.player = player
//        self.present(playerControll, animated:true)
//        {
//            player.play()
//        }
        playVideo(url: url)
    }
    
    @IBAction func btnPlayExternalMovie(_ sender: UIButton) {
        //외부 파일 mp4
        let url = NSURL(string: "https://www.sample-videos.com/video123/mp4/240/big_buck_bunny_240p_30mb.mp4")!
//        let playerController = AVPlayerViewController()
//
//        let player = AVPlayer(url: url as URL)
//        playerController.player = player
//
//        self.present(playerController, animated: true){
//            player.play();
//        }
        playVideo(url:url)

    }
    private func playVideo(url : NSURL){
        let playerControll = AVPlayerViewController()
        let player = AVPlayer(url : url as URL)
        playerControll.player = player
        self.present(playerControll, animated:true)
        {
            player.play()
        }
    }
}

