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

    @IBOutlet weak var emailLogin: UITextField!
    
    @IBOutlet weak var loginOutlet: UIButton!
    
    @IBOutlet weak var passwordLogin: UITextField!
    @IBOutlet weak var lbStatus: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func loginBtn(_ sender: Any) {
        
        Auth.auth().signIn(withEmail: emailLogin.text!, password: passwordLogin.text!) { result , error  in
                   if (error == nil){
                       let detailVc = self.storyboard?.instantiateViewController(withIdentifier: "tabelID") as! tabelNumViewController
                       self.navigationController?.show(detailVc, sender: self)
                       print(result?.user.email ?? "")
                       self.lbStatus.text = "successfully login"

                   }else{
                       
                       print(error?.localizedDescription ?? "")
                       self.lbStatus.text = "email or password is wrong"
                       
                   }
               }
               
           }
        
        
        
        
        
        
        
        
        
        
}
