//
//  ViewController.swift
//  Camtact
//
//  Created by Student on 9/13/17.
//  Copyright © 2017 CKCC. All rights reserved.
//

import UIKit
import Spring

class ViewController: UIViewController {
    @IBOutlet var container: UIView!
    @IBOutlet weak var logo: SpringImageView!
    
//    func prefersstatusbarhiden (){
//        rer
//    }
    override var prefersStatusBarHidden: Bool {
        get {
            return true
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        design()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func design(){
        container.layer.cornerRadius = 0
        container.clipsToBounds = true
    }

}

