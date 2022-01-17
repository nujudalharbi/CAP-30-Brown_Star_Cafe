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

    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        // Do any additional setup after loading the view.
    }
    
  
    @IBAction func cashBtn(_ sender: Any) {
//
//        let doc = dbStore.collection("Orders").document()
//        doc.updateData(["payment": "cash" ])
        UserDefaults.standard.string(forKey: "payment")
        writeToFirestore(payment: "Cash")
    }
    @IBAction func PaymentNetworkBtn(_ sender: Any) {
//
//        let doc = dbStore.collection("Orders").document()
//        doc.updateData(["payment": "PaymentNetwork" ])
        UserDefaults.standard.string(forKey: "payment")
        writeToFirestore(payment:  "PaymentNetwork")
    }
    
    
    func writeToFirestore( payment  : String) {
//         save in order collection
        let doc = dbStore.collection("Orders").document()
        doc.updateData(["payment" :  payment ])
//
    }
}
