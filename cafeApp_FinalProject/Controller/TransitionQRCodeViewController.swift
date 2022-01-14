//
//  transitionQRCodeViewController.swift
//  cafeApp_FinalProject
//
//  Created by نجود  on 30/05/1443 AH.
//

import UIKit

class TransitionQRCodeViewController: UIViewController {

//   --------------- outlet
    
    @IBOutlet weak var descLbl: UILabel!
    
    @IBOutlet weak var clickLbl: UILabel!
    
    
    
//    ---------------------- tap gesture
    @IBAction func tapAction(_ sender: Any) {
        
        print(" Done action")
        
        
        let VC = self.storyboard?.instantiateViewController(withIdentifier: "scanID") as! ScanCodeViewController
        self.navigationController?.show(VC, sender: self)
        
    }
    
    
//    -----------------------
    
    override func viewDidLoad() {
        super.viewDidLoad()
        descLbl.text = NSLocalizedString("descLbl" , comment: "")
        clickLbl.text = NSLocalizedString("click here" , comment: "")
         
        // Do any additional setup after loading the view.
    }


}
