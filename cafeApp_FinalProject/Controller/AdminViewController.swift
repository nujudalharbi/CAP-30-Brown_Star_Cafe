//
//  AdminViewController.swift
//  cafeApp_FinalProject
//
//  Created by نجود  on 15/06/1443 AH.
//

import UIKit
import Firebase
class AdminViewController: UIViewController   , UIImagePickerControllerDelegate & UINavigationControllerDelegate{

    
    let picker = UIImagePickerController()
    
    
    @IBOutlet weak var titleLbl: UILabel!
    
    @IBOutlet weak var productTit: UITextField!
    
    
    @IBOutlet weak var descLbl: UILabel!
    
  
    
    @IBOutlet weak var productDes: UITextField!
    @IBOutlet weak var priceLbl: UILabel!
    
    
    @IBOutlet weak var productPrice: UITextField!
    
    @IBOutlet weak var productImg: UIImageView!
    
  
    @IBOutlet weak var addBtn: UIButton!
    
    @IBAction func addProduct(_ sender: Any) {
        
        
        let dbRef = Firestore.firestore()
        

        let productArray = ["title" : productTit.text! ,
                            "price" : productPrice.text! , "descrabition" : productDes.text! , "image" : ""
                         
        ] as [String : Any]
        
        dbRef.collection("products").addDocument(data: productArray)
        
    }
    @IBAction func TapAddImg(_ sender: Any) {
        print ("nnnn")
    }
    
    
    
    @IBAction func addImg(_ sender: Any) {
        
        
        
        
        present(picker, animated: true, completion: nil)
        
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        picker.delegate = self
        picker.sourceType = .photoLibrary
        picker.title = "Choose Image"
        
        downloadImagesFromCloud()
        
        
        addBtn.setTitle(NSLocalizedString( "addProduct" , comment: ""), for: .normal)

       titleLbl.text = NSLocalizedString("nameProduct" , comment: "")
        descLbl.text = NSLocalizedString("descProduct" , comment: "")
       priceLbl.text = NSLocalizedString("PriceProduct" , comment: "")
        
        // Do any additional setup after loading the view.
    }
  
    func downloadImagesFromCloud() {

    
    
    let storageRef = Storage.storage().reference()
    let folderRef = storageRef.child("Cloud")

    folderRef.listAll { snapshot, error in
        print (snapshot.items.count)
        
        for (_, item) in snapshot.items.enumerated() {
            
            // ----------- Download the image and save it to an array
            item.getData(maxSize: Int64.max) { data, error in
                guard let data = data else { return }
            
            }
        }
    }
}
    
    // MARK: Handle ImagePicker Delegate and Upload the captured image to FB Storage
        func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
            
            // Load the image into imageview
            let image = info[.originalImage] as! UIImage
            self.productImg.image = image
            
            // Convert the image to data
            let data = image.pngData()

            // Handle for FB Storage
            let fbStorage = Storage.storage().reference()
            
            // Generate random number to save it as new image for every upload
            let randomNumber = Int.random(in: 1...2000)
            
            // Handle for the image path and name to be saved
            let imgRef = fbStorage.child("Cloud/newimage\(randomNumber).png")
            
            // Put the data into FB and track its progress
            let task = imgRef.putData(data!, metadata: nil) { metaData, error in
                
                print (metaData)
                
                if (error != nil) {
                    print (error?.localizedDescription)
                }
            }
            
            task.observe(.success) { snapshot in
                print("complete")
        
            }
            
            dismiss(animated: true, completion: nil)
        }
    }



