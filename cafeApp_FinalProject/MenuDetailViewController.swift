//
//  MenuDetailViewController.swift
//  cafeApp_FinalProject
//
//  Created by نجود  on 16/05/1443 AH.
//

import UIKit

class MenuDetailViewController: UIViewController {
    var titleCoffee = ""
    var descriptionCoffee  = ""
    var priceCoffee = 0.0
//    var images = ""
//    var orderArr = [products]()
    override func viewDidLoad() {
        super.viewDidLoad()
        titDetiels.text = titleCoffee
        DescDetiels.text = descriptionCoffee
//        imgDetiels.image = String(images)
        priceDet.text = String(priceCoffee)
    }
    @IBOutlet weak var imgDetiels: UIImageView!
    
    @IBOutlet weak var titDetiels: UILabel!
    
    @IBOutlet weak var DescDetiels: UILabel!

    @IBOutlet weak var priceDet: UILabel!
    
    @IBOutlet weak var NoteTxt: UITextField!
    @IBAction func addBtn(_ sender: Any) {
        
        
        
        
        
        
    }
    @IBAction func noteDet(_ sender: Any) {
    }
}
