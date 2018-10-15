//
//  ViewController.swift
//  doit_day11_Navigation
//
//  Created by Sungho Choi on 11/10/2018.
//  Copyright © 2018 Sungho Choi. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    override func prepare(for segue: UIStoryboardSegue,sender: Any?){
        let editViewController = segue.destination as! EditViewController
        
        if segue.identifier == "editButton" {
            editViewController.textWayValue = "segue : use button"
        }else if segue.identifier == "editBarButton" {
            editViewController.textWayValue = "segue : use Bar button"
        }
        
    }

}

