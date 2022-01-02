//
//  tabelNumViewController.swift
//  cafeApp_FinalProject
//
//  Created by نجود  on 15/05/1443 AH.
//

import UIKit
import FirebaseDatabase
import FirebaseFirestore
class tabelNumViewController: UIViewController {
    let dbStore = Firestore.firestore()
    @IBOutlet weak var tabelNum: UITextField!
    
    
    @IBAction func ADD(_ sender: Any) {
        
//        if tabelNum.text != nil{
//            
//        let detailVc = self.storyboard?.instantiateViewController(withIdentifier: "menuID") as! menuTableViewController
//        self.navigationController?.show(detailVc, sender: self)
//       
//        }else {}
        
             writeToFirestore()
  }
    
    
    func writeToFirestore() {
//        dbStore.collection("Places").addDocument(
//            data: ["Num" : tabelNum.text ?? ""])
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    



}
