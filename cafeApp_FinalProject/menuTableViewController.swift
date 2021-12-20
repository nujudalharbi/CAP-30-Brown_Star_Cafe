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
class menuTableViewController: UITableViewController {

    var productList  =  [ products ]()
    var refProduct : DatabaseReference!
    let dbStore = Firestore.firestore()

//    -----------------------------------
    // TODO: Read from Firestore


    
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
                        let price = object["price"] as? Double
                        let desc = object["descrabition"] as? String
                        
                        let pro = products(title: tit, descrabition: desc, image: img, price: price)
                        self.productList.append(pro)
                        
                        self.tableView.reloadData()
                        print(doc.data())
                    }
                }
            }
            

        }
        
        
    }


    
//  -------------------------------
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {

        return productList.count
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ProductID")as! menuTableViewCell
        let pro : products
        pro = productList[indexPath.row]
        if let imageName = pro.image {
            let url = URL(string: imageName)
            URLSession.shared.dataTask(with: url!) { (data, _, _) in
                if let data = data {
                    DispatchQueue.main.async {
                        cell.imagesProduct.image = UIImage(data: data)
                    }
                }
            }.resume()
        }
        cell.titleProduct.text = pro.title
       
  
        return cell
       
    }
    
//--------------------------------
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let VC = storyboard?.instantiateViewController(withIdentifier: "DetileID") as! MenuDetailViewController

      // performSegue(withIdentifier: "detailsID", sender: nil)
        VC.titleCoffee = productList[indexPath.row].title!
        VC.priceCoffee = productList[indexPath.row].price!
//        VC.imgDetiels = productList[indexPath.row].image!
        VC.descriptionCoffee = productList[indexPath.row].descrabition!
        self.navigationController?.show(VC, sender: true)
    }
    
}





















