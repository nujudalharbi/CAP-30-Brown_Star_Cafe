//
//  PayingOffViewController.swift
//  cafeApp_FinalProject
//
//  Created by نجود  on 12/06/1443 AH.
//

import UIKit
import Firebase
class PayingOffViewController: UIViewController {

    
    
    
    let dbStore = Firestore.firestore()
    var isChangeimgOfBtn = false
//----------------------------------
    
    
    @IBOutlet weak var cashBtnOutlet: UIButton!
    
    @IBOutlet weak var paymentBtnOutlet: UIButton!
    
    @IBOutlet weak var paymentNetworkLbl: UILabel!
    @IBOutlet weak var cashLbl: UILabel!
    
//    ---------------------------
    override func viewDidLoad() {
        super.viewDidLoad()
    
     
          
        // Do any additional setup after loading the view.
    }
    
//  ----------------------
    
    @IBAction func cashBtn(_ sender: Any) {
        
        if isChangeimgOfBtn {
            isChangeimgOfBtn = false
            cashBtnOutlet.setImage(UIImage(named: "circle") , for : .normal)
            
        }
        
        else{
            
                isChangeimgOfBtn = true
                cashBtnOutlet.setImage(UIImage(named: "circle.fill") , for : .normal)
                
      
        }
       UserDefaults.standard.string(forKey: "payment")
        writeToFirestore(payment: "Cash")
    }
//      ------------------------------
   
        func PaymentNetworkBtn(_ sender: Any) {
            
            if isChangeimgOfBtn {
                isChangeimgOfBtn = false
                cashBtnOutlet.setImage(UIImage(named: "circle") , for : .normal)
                
            }
            
            else{
                
                    isChangeimgOfBtn = true
                    cashBtnOutlet.setImage(UIImage(named: "circle.fill") , for : .normal)
                    
          
            }
            
      UserDefaults.standard.string(forKey: "payment")
        writeToFirestore(payment:  "PaymentNetwork")
    }
    
//   --------------------------------
        
    func writeToFirestore( payment  : String) {
//         save in order collection
        let doc = dbStore.collection("Orders").document()
        doc.updateData(["payment" :  payment ])
//
    }
}

