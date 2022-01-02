//
//  CurrentOrderViewController.swift
//  cafeApp_FinalProject
//
//  Created by نجود  on 21/05/1443 AH.
//

import UIKit
import Firebase
import FirebaseFirestore

class CurrentOrderViewController: UIViewController  , UITableViewDelegate , UITableViewDataSource , CellOrder , EditCellOrder{
    
    
    
    
  var hide = true
//    var lastCell
    
    
    
    
    
    @IBAction func CheckOut(_ sender: Any) {

        orderArr.map { $0.canEdit = !$0.canEdit }
        
        hide = !hide
        tabelView.reloadData()
        

    }
    
    func edit(docID: String) {
        let ordercell = dbStore.collection("Orders").document(docID)

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
    
   
    
    
    
    
    var orderArr = [products]()

    var item = 0
    let dbStore = Firestore.firestore()
  
    @IBOutlet weak var tabelView: UITableView!
    
 
    func delete(docID: String) {
        dbStore.collection("Orders").document(docID).delete()
        print ("Doc: \(docID) Deleted")
        loadOrders()

    }
    
    
//    func delete ---------------------------

    
    
    
   
//    total

   
    
    
 
//    --------------------------------------------
    
    override func viewDidLoad() {

        super.viewDidLoad()
        
        tabelView.register(UINib(nibName: "currentOrdTableViewCell", bundle: .main), forCellReuseIdentifier: "currentID")
        tabelView.delegate = self
        tabelView.dataSource = self
        loadOrders()
        
            
         

      
    
    
    }
  


   func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return orderArr.count
    }

   
   
     func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "currentID") as! currentOrdTableViewCell
                 cell.productObj = orderArr[indexPath.row]
                 cell.delegate = self
         
         
//         cell.isUserInteractionEnabled = orderArr[indexPath.row].canEdit
         
        cell.titleOrder?.text = orderArr[indexPath.row].title
//
        
        

        if indexPath.row ==  5{
            cell.FreeOrderLbl.isHidden = false
        }else {
            cell.FreeOrderLbl.isHidden = true

        }
            
         cell.viewCellOrder.layer.cornerRadius = cell.viewCellOrder.frame.height / 2
         cell.backgroundCellOrd.layer.cornerRadius = cell.backgroundCellOrd.frame.height / 2
        return cell
    }
    
 
    
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
                self.tabelView.reloadData()
            }
        }
    }

    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let VC = storyboard?.instantiateViewController(withIdentifier: "editID") as! EditOrderViewController
        self.navigationController?.show(VC, sender: true)
    }
 
    @IBAction func closeOrderBtn(_ sender: Any) {
        for order in orderArr {
            let docRef = dbStore.collection("Orders").document(order.getID())
            docRef.updateData(["status" : "closed"])
        }
    }
    
}
    
    
    
    
    

