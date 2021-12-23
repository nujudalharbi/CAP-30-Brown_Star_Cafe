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
//    var orderArr = [products]()
    override func viewDidLoad() {
        super.viewDidLoad()
        titDetiels.text = titleCoffee
        DescDetiels.text = descriptionCoffee
//       imgDetiels.image = UIImage(named: images)
        priceDet.text = String(priceCoffee)
    }
    @IBOutlet weak var imgDetiels: UIImageView!
    
    @IBOutlet weak var titDetiels: UILabel!
    
    @IBOutlet weak var DescDetiels: UILabel!

    @IBOutlet weak var priceDet: UILabel!
    
    @IBOutlet weak var NoteTxt: UITextField!
    
    @IBAction func addBtn(_ sender: Any) {
        
        let dbRef = Firestore.firestore()
        
        let order = ["title" : titDetiels.text! ,
                     "noteOrder" : NoteTxt.text!]
        dbRef.collection("Orders").addDocument(data: order)
        
        print ("added to DB")
    }

}
