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
        
        
        //        Validate the fields
//                let error = validateFields()
//                if error != nil {
        //            there's something wrong with the fields , show error msg
//                    showError( error!)
                    
//                }else {
        //             create cleaned versions of the data
                    let userName1 = firstName.text!.trimmingCharacters(in: .whitespacesAndNewlines)
                    let userName2 = lastName.text!.trimmingCharacters(in: .whitespacesAndNewlines)
                    let pass = passWord.text!.trimmingCharacters(in: .whitespacesAndNewlines)
                    let email = emailLabel.text!.trimmingCharacters(in: .whitespacesAndNewlines)
                    
                    //        Create the user
                    
                    Auth.auth().createUser(withEmail: "", password: "") {(result , err )in
        //               check for errors
                        if err != nil {
                          
        //                 there was an error creating the user
                            self.showError("error creating user ")
                            
                            
                            
                        }else {
                            
        //                user was created successfully , now store the name
                            
                            let db = Firestore.firestore()
                            db.collection("users").addDocument(data : ["firstName " : userName1  ,  "lastName": userName2 ,"uid" : result!.user.uid]  ) {(error) in
                                if error != nil {
        //                             show error msg
                                    self.showError(" Error saving user data  ")
                                    
                                    
                                    
                                }
//                            }
        //                    Trans
                            self.transitionToHome()
                        }
                        
                    }
                    
                    
                    
                }
                
                
                

        
        
    }
    
    func showError(_ message : String){
       errorLabel.text = message
       errorLabel.alpha = 1
        
    }
    
    func transitionToHome (){
        
        
        
    }
    
    
    func setupElement(){
        
        
        errorLabel.alpha = 0
    }
//    check the fields and validate that the data is correct , if everything is correct , this method return nil . Otherwise , it returns the error msg
//    func validateFields()-> String? {
//         check that all fields in
//        if firstName.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" ||
//            lastName.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" ||
//            passWord.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" ||  emailLabel.text?.trimmingCharacters(in: .whitespacesAndNewlines) == ""{
//            return "Please fill in all field "
//
//        }
//        check if the password is secure
//        let cleanedPassword = passWord.text!.trimmingCharacters(in: .whitespacesAndNewlines)
//        if isPasswordValid( cleanedPassword) == false {
//            password isnot secure enough
//            return "Please make sure your password is at least 8 characters "
//        }
//        return nil
//    }
    
//    func isPasswordValid(_ password : String )-> Bool{
//
//        let passwordTest = NSPredicate(format: "SELF MATCHES %@" , "^(?=.*[a-z])(?=.*[$@$#!%*?&])[A-Za-z\\d$@$#!?%*?&]{8,}")
//        return passwordTest.evaluate(with: password)
//    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupElement()
        // Do any additional setup after loading the view.
    }
    

   

}
