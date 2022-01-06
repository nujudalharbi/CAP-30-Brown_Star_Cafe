//
//  transitionQRCodeViewController.swift
//  cafeApp_FinalProject
//
//  Created by نجود  on 30/05/1443 AH.
//

import UIKit

class TransitionQRCodeViewController: UIViewController {

    
    @IBAction func tapAction(_ sender: Any) {
        
        print(" Done action")
        
        
        let VC = self.storyboard?.instantiateViewController(withIdentifier: "scanID") as! ScanCodeViewController
        self.navigationController?.show(VC, sender: self)
        
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }


}
