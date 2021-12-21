//
//  ProfileViewController.swift
//  cafeApp_FinalProject
//
//  Created by نجود  on 16/05/1443 AH.
//

import UIKit
import FirebaseFirestore
import Firebase
class ProfileViewController: UIViewController, UIImagePickerControllerDelegate & UINavigationControllerDelegate  {

    @IBOutlet weak var imageArt: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        picker.delegate = self
        picker.sourceType = . photoLibrary
        picker.title = "Choose image "

        // Do any additional setup after loading the view.
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
//
        
        
        
//         Here we have the image
        let image = info[.originalImage] as! UIImage
        self.imageArt.image = image
        
//         convert the image
        let data = image.pngData()
        let fbStorage = Storage.storage().reference()
        
        
        let imgRef = fbStorage.child("Cloud/Water.png")
        
        imgRef.putData(data!, metadata: nil){ snapshot , error in
            if (error == nil){
                
                
            }else {
                print(error?.localizedDescription)
                
                
            }
            
        }
        dismiss(animated: true, completion: nil)
    }
    let picker = UIImagePickerController()
    @IBAction func UploadImageArt(_ sender: UIButton) {
//
        present(picker , animated: true, completion: nil)
    }
  

}
