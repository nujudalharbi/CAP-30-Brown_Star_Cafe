//
//  ProductsViewController.swift
//  cafeApp_FinalProject
//
//  Created by نجود  on 22/05/1443 AH.
//

import UIKit

import FirebaseDatabase
import FirebaseFirestore
import Firebase

class ProductsViewController: UIViewController  , UITableViewDelegate , UITableViewDataSource {
    
    
    
    
    var productList  =  [ products ]()
    var refProduct : DatabaseReference!
    let dbStore = Firestore.firestore()
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return productList[p].count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
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
    
   
    
    var p : Int!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
//
//        tableView.register(UINib(nibName : "logoMenuTableViewCell", bundle : nil ) ,forCellReuseIdentifier: "logoID")
        
        
    tabelView.register(UINib(nibName : "productTableViewCell", bundle : nil ) ,forCellReuseIdentifier: "ProductID")
        
        p = 0
    tabelView.rowHeight = 180

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
                        
                        self.tabelView.reloadData()
                        print(doc.data())
                    }
                }
            }
            

        }
        
        
    }

    
    @IBOutlet weak var tabelView: UITableView!
    
    @IBAction func segmentMenu(_ sender: Any) {
        
        p = sender.selectedSegmentIndex
        tabelView.reloadData()
    }
    




//override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//    let VC = storyboard?.instantiateViewController(withIdentifier: "DetileID") as! MenuDetailViewController
//
  // performSegue(withIdentifier: "detailsID", sender: nil)
//    VC.titleCoffee = productList[indexPath.row  ].title!
//    VC.priceCoffee = productList[indexPath.row ].price!
//        VC.imgDetiels.image = UIImage(named : productList[indexPath.row].image!)
//
//    VC.descriptionCoffee = productList[indexPath.row ].descrabition!
//    self.navigationController?.show(VC, sender: true)
//}
//
//}
}
