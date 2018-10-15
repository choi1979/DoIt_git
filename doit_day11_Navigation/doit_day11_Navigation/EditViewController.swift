//
//  EditViewController.swift
//  doit_day11_Navigation
//
//  Created by Sungho Choi on 11/10/2018.
//  Copyright © 2018 Sungho Choi. All rights reserved.
//

import UIKit

class EditViewController: UIViewController {

    var textWayValue: String = ""
    

    @IBOutlet var lblWay: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        lblWay.text = textWayValue
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    @IBAction func btnDone(_ sender: UIButton) {
        _ = navigationController?.popViewController(animated: true)
    }
    
}
