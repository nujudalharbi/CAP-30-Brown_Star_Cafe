//
//  EditOrderViewController.swift
//  cafeApp_FinalProject
//
//  Created by نجود  on 21/05/1443 AH.
//

import UIKit

import FirebaseFirestore
import FirebaseDatabase

protocol EditCellOrder {
 
    func edit(docID: String)
}

class EditOrderViewController: UIViewController {
    
    
    let db = Database.database().reference()
    
    var productObj: products!
    var delegate: CellOrder!
    var indext: Int = 0
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    

    func edit(docID: String) {
//        let ordercell = db.collection("Orders").document(docID)

        // Set the "capital" field of the city 'DC'
//        ordercell.updateData([
//            "capital": true
//        ]) { err in
//            if let err = err {
//                print("Error updating document: \(err)")
//            } else {
//                print("Document successfully updated")
//            }
//        }
        
        

    }

    @IBAction func addCloseOrder(_ sender: Any) {
        
//
//        guard let docID = productObj.id else { return }
//        delegate.edit(docID: docID)
        
    }
}
