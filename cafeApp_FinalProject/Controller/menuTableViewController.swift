//
//  menuTableViewController.swift
//  cafeApp_FinalProject
//
//  Created by نجود  on 15/05/1443 AH.
//

import UIKit
import FirebaseDatabase
import FirebaseFirestore
import Firebase
class MenuTableViewController: UITableViewController {
    
    
//    ------------------- declear a varible

    var productList  =  [ Products ]()
//    var refProduct : DatabaseReference!
    let dbStore = Firestore.firestore()
    
    
    
    

//    -----------------------------------  Read from Firestore


    
    override func viewDidLoad() {
        super.viewDidLoad()
        
      
        
        tableView.register(UINib(nibName : "menuTableViewCell", bundle : nil ) ,forCellReuseIdentifier: "ProductID")
        tableView.rowHeight = 180
       
        dbStore.collection("products").addSnapshotListener { snapshot, error in
            
            guard let docs = snapshot?.documents else { return }
            for doc in docs {
                if let object = doc.data() as? [String : AnyObject] {
                    if (object.count > 0) {
                        let tit = object["title"] as? String
                        let img = object["image"] as? String
                        let price = object["price"] as? String
                        let desc = object["descrabition"] as? String
                        let status = object["status"] as? String
                        
                        let pro = Products(title: tit, descrabition: desc, image: img, price: price
                                           , status: status)
                        self.productList.append(pro)
                        
                        
                        
                        self.tableView.reloadData()
                        print(doc.data())
                    }
                }
            }
            

        }
        
     
    }



    
//  ------------------------------- func delegate 
    

   
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {

        return productList.count
    }
    
//    -----------------------
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
    
                let cell = tableView.dequeueReusableCell(withIdentifier: "ProductID")as! menuTableViewCell
                let pro : Products
                pro = productList[indexPath.row ]
                if let imageName = pro.image {
                    if let url = URL(string: imageName) {
                        URLSession.shared.dataTask(with: url) { (data, _, _) in
                            if let data = data {
                                DispatchQueue.main.async {
                                    cell.imagesProduct.image = UIImage(data: data)
                                }
                            }
                        }.resume()
                    }
                }
                cell.titleProduct.text = pro.title
                
                
//  ----------------      layout cell and image
        
        cell.viewCell.layer.cornerRadius = cell.viewCell.frame.height / 2

        cell.backgroundCellImg.layer.cornerRadius = cell.backgroundCellImg.frame.height / 2
        return cell

    }
    
    
    
//    -------------------
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let VC = storyboard?.instantiateViewController(withIdentifier: "DetileID") as! MenuDetailViewController
        
       
        let selectedCell = tableView.cellForRow(at: indexPath) as! menuTableViewCell
        
        VC.titleCoffee = productList[indexPath.row].getTitle()
        VC.priceCoffee = productList[indexPath.row].getPrice()
        VC.imageDetails = selectedCell.imagesProduct.image
        
        VC.descriptionCoffee = productList[indexPath.row ].getDescrabtion()
        self.navigationController?.show(VC, sender: true)
    }
    
}





















