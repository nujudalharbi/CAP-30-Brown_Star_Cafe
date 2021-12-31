//
//  cartViewController.swift
//  cafeApp_FinalProject
//
//  Created by نجود  on 26/05/1443 AH.
//

import UIKit
import FirebaseFirestore
class cartViewController: UIViewController , UITableViewDelegate , UITableViewDataSource {
    
    let dbStore = Firestore.firestore()
    var orderArr = [products]()
    
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
         
         return orderArr.count
     }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cartID") as! cratTableViewCell
       
        cell.orderLbl.text = orderArr[indexPath.row].title
        cell.viewCellCloseOrd.layer.cornerRadius = cell.viewCellCloseOrd.frame.height / 2
        
        cell.backgroundCell.layer.cornerRadius = cell.backgroundCell.frame.height / 2
        return cell
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        loadOrders()
       tableView.register(UINib(nibName: "cratTableViewCell", bundle: .main), forCellReuseIdentifier: "cartID")
        tableView.delegate = self
        tableView.dataSource = self
        
        
    }
    
    @IBOutlet weak var tableView: UITableView!
    
    fileprivate func loadOrders() {
        dbStore.collection("Orders").getDocuments { snapshot, error in
            guard let snapshot = snapshot else { return }
            self.orderArr.removeAll()
            for doc in snapshot.documents {
                let dict = doc.data() as [String: Any]
                let product = products(title: dict["title"] as? String ?? "",
                                       descrabition: dict["noteOrder"] as? String ?? "",
                                       image: dict["image"] as? String ?? "",
                                       price: dict["price"] as? Double ?? 0.0,
                                       id: doc.documentID,
                                       status: dict["status"] as? String ?? "-")
                self.orderArr.append(product)
                self.tableView.reloadData()
            }
        }
    }
}
