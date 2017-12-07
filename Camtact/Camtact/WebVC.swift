//
//  WebVC.swift
//  Camtact
//
//  Created by Admin on 9/22/17.
//  Copyright © 2017 CKCC. All rights reserved.
//

import UIKit

class WebVC: UIViewController,UIWebViewDelegate{

    @IBOutlet weak var webView: UIWebView!
     let backBG = UIView(frame:  CGRect(x:0 , y: 400, width: 5, height: 50))
    var Url = ""
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        //create a new button
//        let button: UIButton = UIButton(type: UIButtonType.custom) as! UIButton
//        //set image for button
//        button.setImage(UIImage(named: "safari100"), for: UIControlState.normal)
//        //add function for button
//        button.addTarget(self, action: "fbButtonPressed", for: UIControlEvents.touchUpInside)
//        //set frame
////        button.frame = CGRectMake(0, 0, 53, 31)
//        //button.frame = CGRect(0,0,53,31)
//        button.frame = CGRect.init(x: 0, y: 0, width: 2, height: 2)
//
//        let barButton = UIBarButtonItem(customView: button)
//        //assign button to navigationbar
//        self.navigationItem.rightBarButtonItem = barButton
//1
//        let button = UIButton.init(type: .custom)
//        button.setImage(UIImage.init(named: "safari100"), for: UIControlState.normal)
//        button.addTarget(self, action:#selector(ViewController.callMethod), for: UIControlEvents.touchUpInside)
//        button.frame = CGRect.init(x: 0, y: 0, width: 30, height: 30) //CGRectMake(0, 0, 30, 30)
//        let barButton = UIBarButtonItem.init(customView: button)
//        self.navigationItem.leftBarButtonItem = barButton
        
        //
        
        webView.delegate = self
        webView.allowsLinkPreview = true
        webView.allowsInlineMediaPlayback = true
      
        webView.loadRequest(URLRequest(url:URL(string:"http://"+Url)!))
       // webView.scrollView.contentInset.top = 0
       // webView.scrollView.contentInset.bottom = 35
       navigationConfig()
       
        print(Url)
    }
    func navigationConfig() {
        self.navigationController?.navigationBar.isHidden = false
        self.navigationController?.navigationBar.setBackgroundImage(#imageLiteral(resourceName: "blackBg"), for: .default)
        self.navigationController?.navigationBar.alpha = 0.989
        self.navigationController?.navigationBar.isTranslucent = true
        self.navigationController?.view.backgroundColor = .clear
        self.navigationController?.navigationBar.frame =  CGRect(x:0 , y: 405, width:300, height: 40)
    }
    func animat(){
        UIView.animate(withDuration: 5, animations: {
            self.backBG.frame = CGRect(x:0 , y: 400, width: 300, height: 45)
            print(time)
        }) { (bol) in
            if self.webView.isLoading {
                self.backBG.frame = CGRect(x:0 , y: 400, width: 150, height: 40)
                UIView.animate(withDuration: 2,delay:1, animations: {
                    self.backBG.frame = CGRect(x:0 , y: 395, width: 300, height: 45)
                })
                
                
                
            }
            
        }
        
        
    
    }
    override func viewWillAppear(_ animated: Bool) {
       
      
//        let path = UIBezierPath(roundedRect:backBG.bounds,
//                                byRoundingCorners:[.topRight, .bottomLeft],
//                                cornerRadii: CGSize(width: 10, height:  10))
//        
//        let maskLayer = CAShapeLayer()
//        
//        maskLayer.path = path.cgPath
//        backBG.layer.mask = maskLayer
//         webView.scrollView.contentInset.top = 0
//         webView.scrollView.contentInset.bottom = 35
        self.navigationController?.navigationBar.backItem?.backBarButtonItem?.tintColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)

        webView.scrollView.setContentOffset(CGPoint(x:0,y:45), animated: true)
//
        backBG.backgroundColor = #colorLiteral(red: 0.2442496827, green: 0.2442496827, blue: 0.2442496827, alpha: 0.8977151113)
       self.view.addSubview(backBG)
    }
    func webViewDidStartLoad(_ webView: UIWebView) {
        print("Start loading")
        animat()
    }
    func webViewDidFinishLoad(_ webView: UIWebView) {
        print("Finish load")
        self.backBG.frame = CGRect(x:0 , y: 400, width: 300, height: 50)
    }
    func webView(_ webView: UIWebView, shouldStartLoadWith request: URLRequest, navigationType: UIWebViewNavigationType) -> Bool {
        return true
    }
    
    @IBAction func safariBt(_ sender: Any) {
        if #available(iOS 10, *){
            UIApplication.shared.open((self.webView.request?.url!)!)
        }
        else{
            UIApplication.shared.openURL((self.webView.request?.url!)!)
        }
        
    }
   
   
    @IBAction func nextBt(_ sender: Any) {
        self.webView.goForward()
    }
    @IBAction func reloadBt(_ sender: Any) {
        self.webView.reload()
    }
    @IBAction func backBt(_ sender: Any) {
        self.webView.goBack()
    }

}
