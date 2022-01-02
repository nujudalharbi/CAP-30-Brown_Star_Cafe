//
//  reViewController.swift
//  cafeApp_FinalProject
//
//  Created by نجود  on 27/05/1443 AH.
//

import UIKit
import Firebase
import FirebaseDatabase
import FirebaseFirestore
import FirebaseStorage

class reViewController: UIViewController ,UIImagePickerControllerDelegate , UINavigationControllerDelegate , UICollectionViewDelegate , UICollectionViewDataSource {

   
    

    @IBOutlet weak var colectionView: UICollectionView!
    var arr = 0
    var images: [UIImage] = []
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return images.count
    }
    
    @IBAction func addBtn(_ sender: Any) {
        showAlert()
//       downloadImagesFromCloud()
    }
    
    func showAlert(){
        let alert = UIAlertController(title: "Choose Source", message: nil, preferredStyle: .actionSheet)
        alert.addAction(UIAlertAction(title: "camera", style: .default, handler:{ action in
            self.takePhoto(type: .camera)
                                      }))
        alert.addAction(UIAlertAction(title: "PhotoLibrary", style: .default, handler:{ action in
            self.takePhoto(type: .photoLibrary)
                                      }))
        
        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
        present(alert, animated: true , completion: nil)
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = colectionView.dequeueReusableCell(withReuseIdentifier: "imageID", for: indexPath) as! reCollectionViewCell
        cell.imageCell.image = images[indexPath.row]
        return cell
    }
    
   
  
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        downloadImagesFromCloud()
        colectionView.delegate = self
        colectionView.dataSource = self
    }
    func takePhoto(type : UIImagePickerController.SourceType){
        let picker = UIImagePickerController()
        picker.sourceType = type
//       when edit size photo
        picker.allowsEditing = true
        picker.delegate = self
        present(picker , animated: true , completion: nil)
        
        
    }
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let imageFromSource = info[.editedImage] as? UIImage {
         
            self.images.append(imageFromSource)
            self.colectionView.reloadData()
            dismiss(animated: true, completion: nil)

        }else {

           print ("image not found ")
        }
      
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        dismiss(animated: true, completion: nil)
    }
    
    
    
    func downloadImagesFromCloud() {
        

//
    
    
    let storageRef = Storage.storage().reference()
    let folderRef = storageRef.child("tests")

    folderRef.listAll { snapshot, error in
        print (snapshot.items.count)
        
        for (_, item) in snapshot.items.enumerated() {
            // MARK: Download the image and save it to an array
            item.getData(maxSize: Int64.max) { data, error in
                guard let data = data else { return }
                self.images.append(UIImage(data: data)!)
                DispatchQueue.main.async {
                    self.colectionView.reloadData()
                  
                }
            }
        }
    }
}
}

