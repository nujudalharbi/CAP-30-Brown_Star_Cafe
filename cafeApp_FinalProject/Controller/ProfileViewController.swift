//
//  ProfileViewController.swift
//  cafeApp_FinalProject
//
//  Created by نجود  on 16/05/1443 AH.
//

import UIKit
import Firebase
import FirebaseDatabase
import FirebaseFirestore
import FirebaseStorage


class ProfileViewController: UIViewController, UIImagePickerControllerDelegate & UINavigationControllerDelegate , UICollectionViewDelegate, UICollectionViewDataSource  {
    
    
//    -------------------------
    
    var customer = [Customer]()
    let dbStore = Firestore.firestore()
    
    let picker = UIImagePickerController()
    var imgArray = [UIImage]()
//   ---------------------
    
    
    
    @IBOutlet weak var name: UILabel!
    
    @IBOutlet weak var nameUserLbl: UILabel!
    
    @IBOutlet weak var email: UILabel!
    @IBOutlet weak var emailUser: UILabel!
    
    @IBOutlet weak var descProfile: UILabel!
    @IBOutlet weak var imageCloud: UIImageView!
  
    @IBOutlet weak var imagesCollection: UICollectionView!
  
//    --------------------
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureControls()
        infoUser()
        downloadImagesFromCloud()
        
     nameUserLbl.layer.cornerRadius = nameUserLbl.frame.height / 2
        imagesCollection.backgroundColor = UIColor(named: "backgroundColor")
        
       name.text = NSLocalizedString("name", comment: "")
        email.text = NSLocalizedString("email", comment: "")
       descProfile.text = NSLocalizedString( "descProfile", comment: "")
       
    }
    
    
//    ------------------ read customer informatin from firebase
   func infoUser(){
       if let user = Auth.auth().currentUser?.uid{
           let ref = dbStore.collection("users").document(user)
           ref.getDocument{
               (document , error ) in
               if let document = document , document.exists{
                   
                  let dataDecripition  = document.data().map(String.init(describing: )) ?? "nil"
                   
                   self.nameUserLbl.text = document.data()? ["firstName "] as? String
                   self.emailUser.text = document.data()? ["email"] as? String
                   
                   _ = Customer(nameCustomer :  self.nameUserLbl.text ?? "", emailCustomer : self.emailUser.text!)
                   print ("......")
               }
               else {
                   
                   print (error?.localizedDescription as Any)
                   
               }
           }
       }
   
   }
   


   
   //  UICollectionView
   func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
       imgArray.count
   }
   
   func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
       
       let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ImageCellID", for: indexPath) as! imageCellCollectionViewCell
       cell.cellImage.image = imgArray[indexPath.row]
//       cell.cellImage.layer.cornerRadius = cell.cellImage.frame.height / 2
       return cell
   }
//     ---------------------


    // Configuration for UIImagePickerView and UICollectionView
    func configureControls() {
        
        // UIPickerView
        picker.delegate = self
        picker.sourceType = .photoLibrary
        picker.title = "Choose Image"
        
        // UICollectionView
        imagesCollection.delegate = self
        imagesCollection.dataSource = self
     
 
    }
    
//    ---------------------------------------------
    
    // MARK: IBActions


    @IBAction func onUploadPressed(_ sender: UIButton) {
        
        // Show Image Library to choose an image
        present(picker, animated: true, completion: nil)
    
    }
    
    
    
//    -------------------------------------------------
    
    //---------- Download Multiple images from FB and populate in a Collection View
    func downloadImagesFromCloud() {

    
    
    let storageRef = Storage.storage().reference()
    let folderRef = storageRef.child("Art")

    folderRef.listAll { snapshot, error in
        print (snapshot.items.count)
        
        for (_, item) in snapshot.items.enumerated() {
            
            // ----------- Download the image and save it to an array
            item.getData(maxSize: Int64.max) { data, error in
                guard let data = data else { return }
                self.imgArray.append(UIImage(data: data)!)
                DispatchQueue.main.async {
                    self.imagesCollection.reloadData()
                  
                }
            }
        }
    }
}
  
    
    
//    ------------------------------
    // MARK: Handle ImagePicker Delegate and Upload the captured image to FB Storage
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        
        // Load the image into imageview
        let image = info[.originalImage] as! UIImage
        self.imageCloud.image = image
        
        // Convert the image to data
        let data = image.pngData()

        // Handle for FB Storage
        let fbStorage = Storage.storage().reference()
        
        // Generate random number to save it as new image for every upload
        let randomNumber = Int.random(in: 1...2000)
        
        // Handle for the image path and name to be saved
        let imgRef = fbStorage.child("Art/newimage\(randomNumber).png")
        
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


//--------------------------------

class imageCellCollectionViewCell : UICollectionViewCell {
    
    @IBOutlet weak var cellImage: UIImageView!
}

   
    
 
 
    

