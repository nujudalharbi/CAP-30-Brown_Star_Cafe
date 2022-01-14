//
//  HomeViewController.swift
//  cafeApp_FinalProject
//
//  Created by نجود  on 30/05/1443 AH.
//

import UIKit

class HomeViewController: UIViewController {

//    -------------- outlet
    @IBOutlet weak var languageBtn: UIButton!
    @IBOutlet weak var loginBtn: UIButton!
    @IBOutlet weak var signupBtn: UIButton!
    
//   ----------------------------------------------------
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        languageBtn.setTitle(NSLocalizedString("changeLanguage"  , comment: ""), for: .normal)
        
        loginBtn.setTitle(NSLocalizedString( "login" , comment: ""), for: .normal)
        signupBtn.setTitle(NSLocalizedString("signup", comment: ""), for: .normal)
    }
    
    
    
// ------------------------   change language for app
    
    
    @IBAction func languageAction(_ sender: Any) {
        
        let currentLang = Locale.current.languageCode
        let newLanguage = currentLang == "en" ? "ar" : "en"
        UserDefaults.standard.setValue([newLanguage], forKey: "AppleLanguages")
        exit(0)
        
    }
    
}
