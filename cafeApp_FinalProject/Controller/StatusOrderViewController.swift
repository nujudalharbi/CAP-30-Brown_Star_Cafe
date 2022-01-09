//
//  cartViewController.swift
//  cafeApp_FinalProject
//
//  Created by نجود  on 26/05/1443 AH.
//

import UIKit
import FirebaseFirestore
import Firebase
class StatusOrderController: UIViewController , UITableViewDelegate , UITableViewDataSource {
    
    
//   ------------------------ declear a varible
    let dbStore = Firestore.firestore()
    var orderArr = [Products]()
    


//   ---------------------- outlet
        
    @IBOutlet weak var tableView: UITableView!
    
    
//     -------------------------------- read order in firebase
    
    
    fileprivate func loadOrders() {
        dbStore.collection("Orders").getDocuments { snapshot, error in
            guard let snapshot = snapshot else { return }
            self.orderArr.removeAll()
            for doc in snapshot.documents {
                let dict = doc.data() as [String: Any]
                let product = Products(title: dict["title"] as? String ?? "",
                                       descrabition: dict["noteOrder"] as? String ?? "",
                                       image: dict["image"] as? String ?? "",
                                       price: dict["price"] as? Double ?? 0.0,
                                       id: doc.documentID,
                                       status: dict["status"] as? String ?? "")
                self.orderArr.append(product)
                self.tableView.reloadData()
            }
        }
    }
    
//    -------------------------- func delegate
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
         
         return orderArr.count
     }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "statusOrdID") as! StatusOrderTableViewCell
       
        cell.orderLbl.text = orderArr[indexPath.row].title
        
         cell.closedLbl.text = orderArr[indexPath.row].status
        cell.viewCellCloseOrd.layer.cornerRadius = cell.viewCellCloseOrd.frame.height / 2
        
        cell.backgroundCell.layer.cornerRadius = cell.backgroundCell.frame.height / 2
        return cell
    }
    
    
//    ---------------------------------------
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadOrders()
        tableView.register(UINib(nibName: "StatusOrderTableViewCell", bundle: .main), forCellReuseIdentifier: "statusOrdID")
        tableView.delegate = self
        tableView.dataSource = self
        
        
    }
}
