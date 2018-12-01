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

    @IBAction func btnPlayInternalMovie(_ sender: UIButton) {
        let filePath:String? = Bundle.main.path(forResource: "FastTyping", ofType: "mp4")
        let url = NSURL(fileURLWithPath: filePath!)
        let playerControll = AVPlayerViewController()
        let player = AVPlayer(url : url as URL)
        playerControll.player = player
        self.present(playerControll, animated:true)
        {
            player.play()
        }
    }
    
    @IBAction func btnPlayExternalMovie(_ sender: UIButton) {
    }
}

