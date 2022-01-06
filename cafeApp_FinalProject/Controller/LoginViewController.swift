//
//  LoginViewController.swift
//  cafeApp_FinalProject
//
//  Created by نجود  on 18/05/1443 AH.
//

import UIKit
import Firebase
import FirebaseAuth

class LoginViewController: UIViewController {
    
    
//-----------------------outlet
    
    @IBOutlet weak var emailLogin: UITextField!
    
    @IBOutlet weak var passwordLogin: UITextField!
    @IBOutlet weak var lbStatus: UILabel!
    
    
//    ------------------------
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        lbStatus.isHidden = true
    }
    
    
//    -------------------------------------
    
    @IBAction func loginBtn(_ sender: Any) {

//       register a count
        
        Auth.auth().signIn(withEmail: emailLogin.text!, password: passwordLogin.text!) { result , error  in
            
            //            Check the result
            
                   if (error == nil){
                       let VC = self.storyboard?.instantiateViewController(withIdentifier: "transtionID") as! TransitionQRCodeViewController
                       self.navigationController?.show(VC, sender: self)
                       print(result?.user.email ?? "")
                       
                       self.lbStatus.text = "successfully login"

                   }else{
                       
                       print(error?.localizedDescription ?? "")
                       self.lbStatus.isHidden = false
                       self.lbStatus.text = "email or password is wrong"
                       
                   }
               }
               
           }
}
