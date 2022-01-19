//
//  LoginViewController.swift
//  cafeApp_FinalProject
//
//  Created by نجود  on 18/05/1443 AH.
//

import UIKit
import Firebase
import FirebaseAuth

class LoginViewController: UIViewController ,UITextFieldDelegate {
    
    
//-----------------------outlet
  
    
    @IBOutlet weak var desView: UIView!
    
    @IBOutlet weak var emailLogin: UITextField!
    @IBOutlet weak var passwordLogin: UITextField!
 

    @IBOutlet weak var loginBtn: UIButton!
    @IBOutlet weak var lbStatus: UILabel!
    
    
//    ------------------------
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        lbStatus.isHidden = true
        emailLogin.delegate = self
        passwordLogin.delegate = self
        
//        ------
        
        loginBtn.layer.cornerRadius = loginBtn.frame.height / 2
         
//        -----------
        loginBtn.setTitle(NSLocalizedString( "login" , comment: ""), for: .normal)

       lbStatus.text = NSLocalizedString("errorLbl" , comment: "")
        
    }
    
    
//    ------------------------------------- func storyboard keys 
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == emailLogin{
            passwordLogin.becomeFirstResponder()
            
        }else {
            
            Login()
        }
        return true
    }
    
//    ----------------------------
    
    
    @IBAction func loginBtn(_ sender: Any) {
        
        
        if emailLogin.text == "nn@n.com"
        {
            let VC = self.storyboard?.instantiateViewController(withIdentifier: "adminID") as! AdminViewController
            self.navigationController?.show(VC, sender: self)
            
        }else{
          Login()
        }
               
           }
    
//    ----------------------------------------
    
    func Login(){
        
        //       register a count
                
                Auth.auth().signIn(withEmail: emailLogin.text!, password: passwordLogin.text!) { result , error  in
                    
                    //            Check the result
                    
                           if (error == nil){
                               let VC = self.storyboard?.instantiateViewController(withIdentifier: "transtionID") as! TransitionQRCodeViewController
                               self.navigationController?.show(VC, sender: self)
                               print(result?.user.email ?? "")
                               
//                               self.lbStatus.text = "successfully login"

                           }else{
                               
                               print(error?.localizedDescription ?? "")
                               self.lbStatus.isHidden = false
//                               self.lbStatus.text = "email or password is wrong"
                               
                           }
                       }
        
    }
}
