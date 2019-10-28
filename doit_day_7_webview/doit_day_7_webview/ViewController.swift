//
//  ViewController.swift
//  doit_day_7_webview
//
//  Created by Sungho Choi on 01/10/2018.
//  Copyright © 2018 Sungho Choi. All rights reserved.
//

import UIKit

class ViewController: UIViewController , UIWebViewDelegate{

    
    
    
    
    @IBOutlet var txtUrl: UITextField!
    
    @IBOutlet var myWebview: UIWebView!
    @IBOutlet var myActivityIndicator: UIActivityIndicatorView!
    
    func loadWebPage(_ url: String) {
        let myUrl = URL(string: url)
        let myRequest = URLRequest(url: myUrl!)
        myWebview.loadRequest(myRequest)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //load web page
        myWebview.delegate = self
        loadWebPage("https://lotaya.mpt.com.mm")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func webViewDidStartLoad(_ webView: UIWebView) {
        myActivityIndicator.startAnimating()
    }
    func webViewDidFinishLoad(_ webView: UIWebView) {
        myActivityIndicator.stopAnimating()
    }
    func checkUrl(_ url:String)->String{
        var strUrl = url
        let flag = strUrl.hasPrefix("https://")
        if !flag {
            strUrl = "https://"+strUrl
        }
        return strUrl
    }
    @IBAction func btnGotoUrl(_ sender: UIButton) {
        print("txtUrl = "+txtUrl.text!)
        let myUrl = checkUrl(txtUrl.text!)
        txtUrl.text = ""
        loadWebPage(myUrl)
        
    }
    @IBAction func btnGoSite1(_ sender: UIButton) {
        loadWebPage("https://lotaya.mpt.com.mm")
    }
    @IBAction func btnGoSite2(_ sender: UIButton) {
        loadWebPage("https://lotaya.mpt.com.mm/news")
    }
    @IBAction func btnGoHtml(_ sender: UIButton) {
        loadWebPage("https://lotaya.mpt.com.mm/games")
    }
    @IBAction func btnGoFile(_ sender: UIButton) {
        loadWebPage("https://lotaya.mpt.com.mm/service")
    }
    
    @IBAction func btnStop(_ sender: UIBarButtonItem) {
        myWebview.stopLoading()
    }
    @IBAction func btnReload(_ sender: UIBarButtonItem) {
        myWebview.reload()
    }
    @IBAction func btnGoBack(_ sender: UIBarButtonItem) {
        myWebview.goBack()
    }
    @IBAction func btnGoForward(_ sender: UIBarButtonItem) {
        myWebview.goForward()
    }
    
    
    
}

