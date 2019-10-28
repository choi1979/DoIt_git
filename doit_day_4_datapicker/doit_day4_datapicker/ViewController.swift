//
//  ViewController.swift
//  doit_day4_datapicker
//
//  Created by Sungho Choi on 29/09/2018.
//  Copyright © 2018 Sungho Choi. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    let timeSelector: Selector = #selector(ViewController.updateTime)
    let interval = 1.0
    var count = 0
    
    
    @IBOutlet var lblCurrentTime: UILabel!
    @IBOutlet var lblPickerTime: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        Timer.scheduledTimer(timeInterval: interval, target: self, selector: timeSelector, userInfo: nil, repeats: true)
    }

 
    @IBAction func changeDataPicker(_ sender: UIDatePicker) {
        let dataPickerView = sender
        
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd HH:mm:ss EEE"
        lblPickerTime.text = "선택 시간 : "+formatter.string(from: dataPickerView.date)
    }
    @objc func updateTime(){
        let date = NSDate();
        let formatter = DateFormatter();
        formatter.dateFormat = "yyyy-MM-dd HH-mm-ss EEE";
        
        
        lblCurrentTime.text = "현재 시간 : "+formatter.string(from: date as Date);
        
    }
}

