//
//  CurrentOrderViewController.swift
//  cafeApp_FinalProject
//
//  Created by نجود  on 21/05/1443 AH.
//

import UIKit
import Firebase
import FirebaseFirestore

class OrderViewController: UIViewController  , UITableViewDelegate , UITableViewDataSource {
    
    
    
    
//    -------------- declear a varible
    
    
    var orderArr = [Products]()

    var item = 0
    let dbStore = Firestore.firestore()
    

//  --------------- outlet
    @IBOutlet weak var tabelView: UITableView!
    

    

//    --------------------------------------------
    
    override func viewDidLoad() {

        super.viewDidLoad()
        
        tabelView.register(UINib(nibName: "OrderTableViewCell", bundle: .main), forCellReuseIdentifier: "orderID")
        tabelView.delegate = self
        tabelView.dataSource = self
        loadOrders()
    
    }
//    -------------------------
  
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
                                       qunatity: dict["qunatity"] as? String ?? "" ,
                                      
                                       status: dict["status"] as? String ?? "-")
                self.orderArr.append(product)
                self.tabelView.reloadData()
            }
        }
    }

    
//----------------------------------------- func delegate
   func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return orderArr.count
    }

   
    
    
   
     func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "orderID") as! OrderTableViewCell

//         let pro : Products
//         pro = orderArr[indexPath.row]
//         if let imageName = pro.image {
//             let url = URL(string: imageName)
//             URLSession.shared.dataTask(with: url! ) { (data, _, _) in
//                 if let data = data {
//                     DispatchQueue.main.async {
//                         cell.orderImg.image = UIImage(data: data)
//                     }
//                 }
//             }.resume()
//         }
//         
         
         
         
         
         
        cell.titleOrder?.text = orderArr[indexPath.row].getTitle()
         cell.qauntityLbl?.text = orderArr[indexPath.row].getQunatity()
         cell.viewCellOrder.layer.cornerRadius = cell.viewCellOrder.frame.height / 2
         cell.backgroundCellOrd.layer.cornerRadius = cell.backgroundCellOrd.frame.height / 2
        return cell
    }
    
 
//    -------------
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let VC = storyboard?.instantiateViewController(withIdentifier: "editID") as! EditOrderViewController
        VC.selectedOrder = orderArr[indexPath.row]
        self.navigationController?.show(VC, sender: true)
    }
 
    @IBAction func closeOrderBtn(_ sender: Any) {
        for order in orderArr {
            let docRef = dbStore.collection("Orders").document(order.getID())
            docRef.updateData(["status" : "closed"])
          
        }
    }
    
//    --------------- func delete order
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            let orderDoc = dbStore.collection("Orders").document(orderArr[indexPath.row].id!)
            orderDoc.delete()
            
            { err in
            var alertVC = UIAlertController(title: "Delete", message: " Successfuly Remove", preferredStyle: .alert)
            alertVC.addAction(UIAlertAction(title:"ok",style: .cancel, handler: nil))
            self.present(alertVC, animated: true, completion: nil)}
            
        }else
   
   {
        
        self.orderArr.remove(at: indexPath.row)
        tabelView.deleteRows(at: [indexPath], with: .fade)
    }
  }

    
    
    
    
    
}


    
    

    
    
    
    
    

