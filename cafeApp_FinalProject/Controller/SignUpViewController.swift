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
    
    
    
//---------------------------outlet
    
    
    @IBOutlet weak var firstName: UITextField!
    
    @IBOutlet weak var lastName: UITextField!
    
    @IBOutlet weak var emailLabel: UITextField!
    
    @IBOutlet weak var errorLabel: UILabel!
    @IBOutlet weak var passWord: UITextField!
    
   
    
//    ---------------------------------------
    
    @IBAction func addBtnAction(_ sender: Any) {
        
        
        let userName1 = firstName.text!
        let userName2 = lastName.text!
        
//--------- create new a count for user
        
        
        Auth.auth().createUser(withEmail: emailLabel.text!, password: passWord.text!) { [self] result , error  in
            
            
//------------- Check the result
            
            
            if (error == nil){
                let VC = self.storyboard?.instantiateViewController(withIdentifier: "transtionID") as! TransitionQRCodeViewController
                self.navigationController?.show(VC, sender: self)
            
//----------------  write information user in firestore
                
                let db = Firestore.firestore()
                let doc = db.collection("users").document(Auth.auth().currentUser!.uid)
        
                
                doc.setData(["firstName " : userName1  ,  "lastName": userName2 , "email" : emailLabel.text! , "uid" : result?.user.uid]  ) { (error) in
                    errorLabel.isHidden = true
        }
                
                print(result?.user.email ?? "no email")
            } else {
                print(error?.localizedDescription ?? "")
                
                errorLabel.isHidden = false
            }
        
    
                }

    }
//     -------------------------
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        errorLabel.isHidden = true
        firstName.textColor = UIColor(named: "Color")

        lastName.textColor = UIColor(named: "Color")
        
        emailLabel.textColor = UIColor(named: "Color")
        
        passWord.textColor = UIColor(named: "Color")
        
    }
    

   

}
