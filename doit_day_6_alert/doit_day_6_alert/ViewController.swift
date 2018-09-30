//
//  ViewController.swift
//  doit_day_6_alert
//
//  Created by Sungho Choi on 30/09/2018.
//  Copyright © 2018 Sungho Choi. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
    let lampOn = UIImage(named: "lamp-on.png")
    let lampOff = UIImage(named: "lamp-off.png")
    let lampRemove = UIImage(named: "lamp-remove.png")
    var isLampOn = true

    @IBOutlet var lampImg: UIImageView!
    
    @IBAction func btnLampOn(_ sender: UIButton) {
//        if isLampOn {
//            //showAlert(inDec: "현재 On 상태입니다")
//            showAlert(inType : "on" ,inTitle:"경고", inDec: "현재 On 상태입니다")
//        }else{
//            setLamp(inImg: lampOn)
//            isLampOn = !isLampOn
//        }
        btnActionFun(actionType: "on")
    }
    @IBAction func btnLampOff(_ sender: UIButton) {
//        if isLampOn {
//            //lampImg.image = lampOff
//            showAlert(inType : "off" ,inTitle:"램프 끄기", inDec: "램프를 끄시겠습니까?")
//        }else{
//            showAlert(inType : "on" ,inTitle:"경고", inDec: "현재 Off 상태입니다")
//        }
        btnActionFun(actionType: "off")
    }
    @IBAction func btnLampRemove(_ sender: UIButton) {
//        showAlert(inType : "remove" ,inTitle:"램프 제거", inDec: "램프를 제거 하시겠습니까?")
        btnActionFun(actionType: "remove")
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        lampImg.image = lampOn
    }
    func btnActionFun (actionType type : String, isLinkAction link : String? = nil ){
        if type == "on" {
            if isLampOn {
                //showAlert(inDec: "현재 On 상태입니다")
                showAlert(inType : "on" ,inTitle:"경고", inDec: "현재 On 상태입니다")
            }else{
                setLamp(inImg: lampOn)
                isLampOn = !isLampOn
            }
        }else if type == "off" {
            if isLampOn {
                if link=="off" {
                    setLamp(inImg: lampOff)
                    isLampOn = !isLampOn
                }else{
                    showAlert(inType : "off" ,inTitle:"램프 끄기", inDec: "램프를 끄시겠습니까?")
                }
            }else{
                showAlert(inType : "on" ,inTitle:"경고", inDec: "현재 Off 상태입니다")
            }
        }else{
            showAlert(inType : "remove" ,inTitle:"램프 제거", inDec: "램프를 제거 하시겠습니까?")
        }
    }
    func showAlert(inType type: String, inTitle titleStr : String, inDec decStr : String){
        let lampOnOffAlert = UIAlertController(title: titleStr, message: decStr, preferredStyle: UIAlertController.Style.alert)
        if type == "on" {
            let onAction = UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil)
            lampOnOffAlert.addAction(onAction)
        } else if type=="off" {
            let offAction = UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: {
                ACTION in self.lampImg.image = self.lampOff
                self.isLampOn = false
            })
            let cancelAction = UIAlertAction(title: "NO", style: UIAlertAction.Style.default, handler: nil)
            lampOnOffAlert.addAction(offAction)
            lampOnOffAlert.addAction(cancelAction)
        }else if type=="remove" {
            let offAction = UIAlertAction(title: "아니오, 끕니다(off)", style: UIAlertAction.Style.default, handler: {
                ACTION in self.btnActionFun(actionType: "off",isLinkAction: "off")
            })
            let onAction = UIAlertAction(title: "아니오, 켭니다(on)", style: UIAlertAction.Style.default, handler: {
                ACTION in self.btnActionFun(actionType: "on")
            })
            let removeAction = UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: {
                ACTION in self.lampImg.image = self.lampRemove
                self.isLampOn = false
            })
            lampOnOffAlert.addAction(offAction)
            lampOnOffAlert.addAction(onAction)
            lampOnOffAlert.addAction(removeAction)
        }
        
        present(lampOnOffAlert,animated: true,completion: nil)
    }
    func setLamp(inImg img : UIImage? ){
        lampImg.image = img
        
    }

}

