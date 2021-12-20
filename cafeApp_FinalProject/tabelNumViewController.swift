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
       
        writeToFirestore()
        
    }
    
    
    func writeToFirestore() {
        dbStore.collection("Places").addDocument(
            data: ["Num" : tabelNum.text ?? ""])
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
