//
//  ViewController.swift
//  Test01
//
//  Created by Eiji Kitajima on 2019/04/23.
//  Copyright © 2019 Eiji Kitajima. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var text01: UITextField!
    @IBAction func ButtonTap(_ sender: Any) {
        text01.text = "タップしました"
    }
    
    @IBOutlet weak var text02: UITextField!
    @IBAction func clear(_ sender: Any) {
        text02.text = ""
    }
    


    @IBAction func settings(_ sender: Any) {
        UIApplication.shared.open(URL(string: "App-Prefs:")!, options: [:], completionHandler: nil)
    }
    
    @IBAction func Twitter(_ sender: Any) {
        UIApplication.shared.open(URL(string: "twitter://timeline")!, options: [:], completionHandler: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
 
}

