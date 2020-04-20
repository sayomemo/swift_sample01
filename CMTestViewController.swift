//
//  CMTestViewController.swift
//  Test01
//
//  Created by Eiji Kitajima on 2019/06/04.
//  Copyright © 2019 Eiji Kitajima. All rights reserved.
//

import UIKit
import CoreMotion

class CMTestViewController: UIViewController {

    let motionManager = CMMotionManager()
    
    @IBOutlet weak var CMx: UILabel!
    @IBOutlet weak var CMy: UILabel!
    @IBOutlet weak var CMz: UILabel!
    
    @IBOutlet weak var CMinput: UILabel!
    @IBOutlet weak var iText: UILabel!
    
    
    
    //motion
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        if motionManager.isAccelerometerAvailable {
            // intervalの設定 [sec]
            motionManager.accelerometerUpdateInterval = 1
            
            // センサー値の取得開始
            motionManager.startAccelerometerUpdates(
                to: OperationQueue.current!,
                withHandler: {(accelData: CMAccelerometerData?, errorOC: Error?) in
                    self.outputAccelData(acceleration: accelData!.acceleration)
            })
            
        }
    }
    
    func outputAccelData(acceleration: CMAcceleration){
        // 加速度センサー [G]
        
        self.CMx.text = String(format: "x = %06f", acceleration.x)
        self.CMy.text = String(format: "y = %06f", acceleration.y)
        self.CMz.text = String(format: "z = %06f", acceleration.z)
        self.CMinput.text = String(format: "input = %06f", acceleration.x + 0.5)
    }

   /* @IBAction func iText(_ sender: Any) {
        
        var val:String?;
        val = CMinput.text;
        var num:Double?;
        if val != nil{
            num = Double(val!);
            if 1 < num!{
                iText.text = "入力されました";
            }else{
                iText.text = "入力されません";
            }
        }
    }*/
    //止める場合
    func stopAccelerometer(){
        if (motionManager.isAccelerometerActive) {
            motionManager.stopAccelerometerUpdates()
        }
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
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
