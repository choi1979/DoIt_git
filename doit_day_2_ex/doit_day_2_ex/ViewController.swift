//
//  ViewController.swift
//  doit_day_2_ex
//
//  Created by Sungho Choi on 29/09/2018.
//  Copyright © 2018 Sungho Choi. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var imgArr=["01.png","02.png","03.png","06.png"]
    var selectNum:Int = 0;
    var targetImg: UIImage?
    @IBOutlet var screenBox: UIImageView!
    
    
    @IBAction func nextBtn(_ sender: UIButton) {
        selectNum+=1
        updateImage()
    }
    @IBAction func prevBtn(_ sender: UIButton) {
        if selectNum == 0 {
            selectNum = imgArr.count-1
        }else{
            selectNum-=1
        }
        
        updateImage()
    }
  
    override func viewDidLoad() {
        super.viewDidLoad()
        updateImage()
        
    }

    func updateImage(){
        selectNum = selectNum % imgArr.count
        print(imgArr.count,selectNum)
        targetImg = UIImage(named:  imgArr[selectNum])
        screenBox.image = targetImg
    }
}

