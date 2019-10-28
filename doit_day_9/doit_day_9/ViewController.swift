//
//  ViewController.swift
//  doit_day_9
//
//  Created by Sungho Choi on 05/10/2018.
//  Copyright © 2018 Sungho Choi. All rights reserved.
//

import UIKit

var images = ["01.png","02.png","03.png","04.png","05.png","06.png"]

class ViewController: UIViewController {

    
    @IBOutlet var imgView: UIImageView!
    @IBOutlet var pageControl: UIPageControl!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        pageControl.numberOfPages = images.count
        pageControl.currentPage = 0
        pageControl.pageIndicatorTintColor = UIColor.green
        pageControl.currentPageIndicatorTintColor = UIColor.red
        imgView.image = UIImage(named: images[0])
        
    }

    @IBAction func pageChanged(_ sender: UIPageControl) {
        imgView.image = UIImage(named:images[pageControl.currentPage])
    }
    
    
    
    
}

