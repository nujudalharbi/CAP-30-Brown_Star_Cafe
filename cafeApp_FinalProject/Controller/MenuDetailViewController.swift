//
//  MenuDetailViewController.swift
//  cafeApp_FinalProject
//
//  Created by نجود  on 16/05/1443 AH.
//

import UIKit
import Firebase
import FirebaseFirestore

class MenuDetailViewController: UIViewController {
    
    
    
//    ---------------- declear a varible
    var titleCoffee = ""
    var descriptionCoffee  = ""
    var priceCoffee = ""
    var counter = 0
    
    
    
   

    
    
   

    
    var imageDetails: UIImage?
    
    var orderArr = [Products]()
    
    
//    -------------------------- outlet
    
    
    @IBOutlet weak var imgDetiels: UIImageView!
    
    @IBOutlet weak var titDetiels: UILabel!
    
    @IBOutlet weak var DescDetiels: UILabel!

    @IBOutlet weak var priceDet: UILabel!
    
    @IBOutlet weak var NoteTxt: UITextField!
    
    @IBOutlet weak var quantityLbl: UILabel!
    
    
//    --------------------------- increase quantity order
    @IBAction func quantityPlusBtn(_ sender: Any) {
        
        counter += 1
        quantityLbl.text = String (counter)
    }
    
    
//    -------------------------- decrease quantity order
    @IBAction func quantityMinsBtn(_ sender: Any) {
        if (counter == 0){
            return quantityLbl.text = String (counter)
        }else{
        counter -= 1
      return quantityLbl.text = String (counter)
        }
        
    }
//    -------------------- add order from firbase
    
    @IBAction func addBtn(_ sender: Any) {
        
        addOrder()
    }
    func addOrder(){
        let dbRef = Firestore.firestore()
        
        let tableNum = UserDefaults.standard.string(forKey: "tablenum")
      let payment = UserDefaults.standard.string(forKey: "payment")
        let orderArray = ["title" : titDetiels.text! ,
                          "noteOrder" : NoteTxt.text! , "qunatity" : quantityLbl.text! , "status" : "open",
                          "tableNum" : tableNum ,  "payment" : payment
                         ]
        
        dbRef.collection("Orders").addDocument(data: orderArray)
        
        print ("added to DB")
    }
    
    
    
//    ---------------------------
    
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == NoteTxt {
        addOrder()
            
        }
        return true
    }
//    -------------
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        titDetiels.text = titleCoffee
    
        DescDetiels.text = descriptionCoffee
    
        
        
        if let imageDetails = imageDetails {
            self.imgDetiels.image = imageDetails

        }
        priceDet.text = String(priceCoffee )
        
        
        NoteTxt.backgroundColor = UIColor.white
        
 
    }
}
