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
    var titleCoffee = ""
    var descriptionCoffee  = ""
    var priceCoffee = 0.0
    var images = ""
    
//    ---------------------------
    var cellIndex = 0
    
    var counter = 0
//    --------------------------
    
    
    
    @IBOutlet weak var totalLbl: UILabel!
//
//    func calculateTotalPrice ()-> String{
//
//        var prices : Float = 0
//
//
//        prices  += Float(priceCoffee) * Float(quantityLbl.text)!
//
//        return "\(quantityLbl.text = String(prices))"
//    }
    

    
    var imageDetails: UIImage?
    var orderArr = [products]()
    override func viewDidLoad() {
        super.viewDidLoad()
        titDetiels.text = titleCoffee
        DescDetiels.text = descriptionCoffee
        if let imageDetails = imageDetails {
            self.imgDetiels.image = imageDetails
//            calculateTotalPrice()
        }
       
        priceDet.text = String(priceCoffee)
    }
    @IBOutlet weak var imgDetiels: UIImageView!
    
    @IBOutlet weak var titDetiels: UILabel!
    
    @IBOutlet weak var DescDetiels: UILabel!

    @IBOutlet weak var priceDet: UILabel!
    
    @IBOutlet weak var NoteTxt: UITextField!
    
    @IBOutlet weak var quantityLbl: UILabel!
    
    
    
    @IBAction func quantityPlusBtn(_ sender: Any) {
        
        counter += 1
        quantityLbl.text = String (counter)
    }
    
    
    
    @IBAction func quantityMinsBtn(_ sender: Any) {
        if (counter == 0){
            return quantityLbl.text = String (counter)
        }else{
        counter -= 1
      return quantityLbl.text = String (counter)
        }
        
        
        
    }
    
    @IBAction func addBtn(_ sender: Any) {
        
        let dbRef = Firestore.firestore()
        
        let order = ["title" : titDetiels.text! ,
                     "noteOrder" : NoteTxt.text! , "qunatity" : quantityLbl.text! , "status" : "open"]
        dbRef.collection("Orders").addDocument(data: order)
        
        print ("added to DB")
    }
    
    
    
    
    

}
