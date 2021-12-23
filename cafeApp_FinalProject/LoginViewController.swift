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
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func loginBtn(_ sender: Any) {
        if let email = emailLogin.text , let pass = passwordLogin.text{
            Auth.auth().signIn(withEmail: email, password: pass , completion: {
                (user , error ) in
                
            })
        
        }}
    
 

}
