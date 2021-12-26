//
//  ProductsViewController.swift
//  cafeApp_FinalProject
//
//  Created by نجود  on 21/05/1443 AH.
//

import UIKit
struct product {
    
   var name = ""
    var menu = [products]()
    
}
class ProductsViewController: UIViewController  {
  
    var menuArr = [product]()

    

    @IBOutlet weak var productTabelView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

       
    }
    
    
//
//    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        <#code#>
//    }
    
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        <#code#>
//    }
}
