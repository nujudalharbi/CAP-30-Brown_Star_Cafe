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
    
    
//    func delete ---------------------------
   
    func delete(docID: String) {
        dbStore.collection("Orders").document(docID).delete()
        print ("Doc: \(docID) Deleted")
        loadOrders()

    }
    
    
    
    
    func edit(docID: String) {
        let ordercell = dbStore.collection("Orders").document("docID")

        // Set the "capital" field of the city 'DC'
        ordercell.updateData([
            "capital": true
        ]) { err in
            if let err = err {
                print("Error updating document: \(err)")
            } else {
                print("Document successfully updated")
            }
        }
        
        

    }
//    total

   
    
    
 
    
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
                                       id: doc.documentID)
                self.orderArr.append(product)
                self.tableView.reloadData()
            }
        }
    }
    
//    --------------------------------------------
    
    override func viewDidLoad() {

        super.viewDidLoad()
        
        tableView.register(UINib(nibName: "OrderItemTableViewCell", bundle: .main), forCellReuseIdentifier: "orderID")
        
        loadOrders()
        
    }



    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return orderArr.count
    }

   
   
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "orderID") as! OrderItemTableViewCell

//        let cell = UITableViewCell(style: .subtitle, reuseIdentifier: nil)
//        cell.productObj = orderArr[indexPath.row]
//        cell.delegate = self
        cell.textLabel?.text = orderArr[indexPath.row].title
//        totel.text = price * title
        
        
        
        if indexPath.row ==  5{
            cell.freeOrder.isHidden = false
        }else {
            cell.freeOrder.isHidden = true
            
        }
            
//       }
        
        return cell
    }
    
    
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    

    
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let VC = storyboard?.instantiateViewController(withIdentifier: "editID") as! EditOrderViewController

 
        self.navigationController?.show(VC, sender: true)
    }
 
}
