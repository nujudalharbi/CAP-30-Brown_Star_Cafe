//
//  SignUpViewController.swift
//  cafeApp_FinalProject
//
//  Created by نجود  on 15/05/1443 AH.
//

import UIKit
import FirebaseAuth
import Firebase
class SignUpViewController: UIViewController {

    @IBOutlet weak var firstName: UITextField!
    
    @IBOutlet weak var lastName: UITextField!
    
    @IBOutlet weak var emailLabel: UITextField!
    
    @IBOutlet weak var errorLabel: UILabel!
    @IBOutlet weak var passWord: UITextField!
    
    @IBOutlet weak var addBtnOutlet: UIButton!
    @IBAction func addBtnAction(_ sender: Any) {
        
        
        let userName1 = firstName.text!
        let userName2 = lastName.text!
        Auth.auth().createUser(withEmail: emailLabel.text!, password: passWord.text!) { [self] result , error  in
//            Check the result and let them in
            
            
            if (error == nil){
                let detailVc = self.storyboard?.instantiateViewController(withIdentifier: "scanID") as! ScanCodeViewController
                self.navigationController?.show(detailVc, sender: self)
            
            
                let db = Firestore.firestore()
                db.collection("users").addDocument(data : ["firstName " : userName1  ,  "lastName": userName2 , "email" : emailLabel.text! , "uid" : result?.user.uid]  ) {(error) in
                    errorLabel.isHidden = true

        }
                
                print(result?.user.email ?? "no email")
            } else {
                print(error?.localizedDescription ?? "")
                errorLabel.isHidden = false
            }
        
        
    
        
   

 
                            
                  
                    
                    
                    
                }
                
                
                

        
        
    }
    


    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    

   

}
