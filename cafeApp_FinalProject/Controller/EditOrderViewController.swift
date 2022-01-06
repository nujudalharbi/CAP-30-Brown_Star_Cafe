//
//  EditOrderViewController.swift
//  cafeApp_FinalProject
//
//  Created by نجود  on 21/05/1443 AH.
//

import UIKit

import FirebaseFirestore
import FirebaseDatabase



class EditOrderViewController: UIViewController {
    
    
    
//     ------------------ declear a varible
    
    
    
    var counter = 0
    var selectedOrder = products()
    

    let dbStore = Firestore.firestore()
    
    
    
    
    @IBOutlet weak var editTitleText: UITextField!
    
 
    @IBAction func increaseBtn(_ sender: Any) {
        counter += 1
        quantityLbl.text = String (counter)
        
    }
    @IBAction func decreaseBtn(_ sender: Any) {
        
        
        if (counter == 0){
            return quantityLbl.text = String (counter)
        }else{
        counter -= 1
      return quantityLbl.text = String (counter)
        }
    }
    @IBOutlet weak var quantityLbl: UILabel!
    
    
    
//     ----------------- update title and qunatity order and save firebase

    func edit() {

   
              
        let washingtonRef = dbStore.collection("Orders").document(selectedOrder.id!)

    
        washingtonRef.updateData(["title" :editTitleText.text
        ,"qunatity": quantityLbl.text
    ]) { err in
        if let err = err {
            print("Error updating document: \(err)")
        } else {
            print("Document successfully updated")
        }
    }
    }

    @IBAction func addCloseOrder(_ sender: Any) {
        
edit()
        
    }
    
//    ---------------------------------
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
}
