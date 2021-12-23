//
//  OrderTableViewController.swift
//  cafeApp_FinalProject
//
//  Created by نجود  on 16/05/1443 AH.
//

import UIKit
import Firebase
import FirebaseFirestore


class OrderTableViewController: UITableViewController {
    var item = 0
    var orderArr = [products]()
    
    let dbStore = Firestore.firestore()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.register(UINib(nibName: "OrderItemTableViewCell", bundle: .main), forCellReuseIdentifier: "orderID")
        
        dbStore.collection("Orders").getDocuments { snapshot, error in
        
            guard let snapshot = snapshot else { return }
            
            for doc in snapshot.documents {
                
                let dict = doc.data() as [String: Any]
                let product = products(title: dict["title"] as? String ?? "",
                                       descrabition: dict["noteOrder"] as? String ?? "",
                                       image: dict["image"] as? String ?? "",
                                       price: dict["price"] as? Double ?? 0.0)
                self.orderArr.append(product)
                    self.tableView.reloadData()
            }
        }
        
    }



    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return orderArr.count
    }

   
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        let cell = tableView.dequeueReusableCell(withIdentifier: "orderID") as! OrderItemTableViewCell

        let cell = UITableViewCell(style: .subtitle, reuseIdentifier: nil)
        cell.textLabel?.text = orderArr[indexPath.row].title
        return cell
    }
    
//    @IBAction func tapAction(_ sender: Any) {
//        print (",,,,,,,")
//        let alert = UIAlertController(title : "Are you sure to delete ?!" , message: nil , preferredStyle: .alert)
//        alert.addAction(UIAlertAction(title: "yes", style: .default, handler: {
//           action in
//            self.orderArr.remove(at : self.item)
//            self.tableView.reloadData()
//        }))
//        alert.addAction(UIAlertAction(title: "no", style: .default, handler:{action in
//
//        } ))
//        present(alert , animated: true , completion: nil)
//    }
    

    

}
