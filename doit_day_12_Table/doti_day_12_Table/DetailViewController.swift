//
//  DetailViewController.swift
//  doti_day_12_Table
//
//  Created by Sungho Choi on 15/12/2018.
//  Copyright © 2018 Sungho Choi. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    var recieveItem = ""
    
    @IBOutlet var lblItem: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        lblItem.text = recieveItem
    }
    
    func recieveItem(_item:String){
        recieveItem = _item
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
