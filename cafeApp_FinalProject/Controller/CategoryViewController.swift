//
//  CategoryViewController.swift
//  cafeApp_FinalProject
//
//  Created by نجود  on 14/06/1443 AH.
//

import UIKit

class CategoryViewController: UIViewController  , UITableViewDelegate , UITableViewDataSource {
    
    
    var productCategory = [Products]()
    
  
//    func numberOfSections(in tableView: UITableView) -> Int {
//        return 3
//    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        if indexPath.row == 0 {
                   let cellBanner =
                   tableView.dequeueReusableCell(withIdentifier: "categoryID") as! categoryTableViewCell
  
            
            
            return cellBanner
        
                 
//               }else {
//                   let cellProduct =
//                   tableView.dequeueReusableCell(withIdentifier: "ProductID") as! productCell
//                   cellProduct.title.text = item[indexPath.row - 1].title
//                   cellProduct.details.text = item[indexPath.row - 1].details
//                   cellProduct.price.text = String(item[indexPath.row - 1].cost)
//                   cellProduct.imgItem.image = UIImage(named: item[indexPath.row - 1].imgProduct)
//                   return cellProduct
//               }
               
               
               
    }
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
       tableView.register(UINib(nibName: "categoryTableViewCell", bundle: .main), forCellReuseIdentifier: "categoryID")
        tableView.delegate = self
        tableView.dataSource = self
     
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    
    }

}
