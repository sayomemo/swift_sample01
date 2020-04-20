//
//  CMTest2ViewController.swift
//  Test01
//
//  Created by Eiji Kitajima on 2019/07/10.
//  Copyright © 2019 Eiji Kitajima. All rights reserved.
//

import UIKit
import CoreMotion

class CMTest2ViewController: UIViewController {
    
    @IBOutlet weak var label: UILabel!
    let pedometer = CMPedometer()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.startStepCounting()
        // Do any additional setup after loading the view.
    }
 
    func startStepCounting() {
        // CMPedometerが利用できるか確認
        if CMPedometer.isStepCountingAvailable() {
            // 計測開始
            pedometer.startUpdates(from: NSDate() as Date, withHandler: {
                data, error in DispatchQueue.main.async {
                    // 歩数
                    let steps = data?.numberOfSteps
                    // 結果をラベルに出力
                    self.label.text = "Steps: \(String(describing: steps))"
                }
            })
        }
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    //戻る
    @IBAction func Back(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
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
