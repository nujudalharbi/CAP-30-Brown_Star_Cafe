//
//  ScanCodeViewController.swift
//  cafeApp_FinalProject
//
//  Created by نجود  on 20/05/1443 AH.
//

import UIKit
import AVFoundation
import FirebaseDatabase
import FirebaseFirestore
import Firebase

class ScanCodeViewController: UIViewController , AVCaptureMetadataOutputObjectsDelegate {
    

    var video = AVCaptureVideoPreviewLayer()

    let session = AVCaptureSession()

    override func viewDidLoad() {
        super.viewDidLoad()
//      creating session
//        --------
        
        do{
//     1    define capture device
            guard let captureDevice = AVCaptureDevice.default(for: AVMediaType.video) else { return  }
            
          let input = try AVCaptureDeviceInput(device : captureDevice)
            session.addInput(input)
            
            
        }
        catch{
            print("error")
        }
        
//        2
        let output = AVCaptureMetadataOutput()
        session.addOutput(output)
//         3
        output.setMetadataObjectsDelegate(self, queue: DispatchQueue.main)
        output.metadataObjectTypes = [AVMetadataObject.ObjectType.qr]
        video = AVCaptureVideoPreviewLayer(session: session)
        video.frame = view.layer.bounds
        view.layer.addSublayer(video)
        
        session.startRunning()
    }
    func metadataOutput(_ output: AVCaptureMetadataOutput, didOutput metadataObjects: [AVMetadataObject], from connection: AVCaptureConnection) {
        if metadataObjects != nil  && metadataObjects.count != 0{
            
           if let object = metadataObjects[0] as? AVMetadataMachineReadableCodeObject
            {
               self.session.stopRunning()
               if object.type == AVMetadataObject.ObjectType.qr {
                   UserDefaults.standard.set(object.stringValue!, forKey: "tablenum")
                   print(object.stringValue)
                   let tabvc = self.storyboard?.instantiateViewController(withIdentifier: "tabid") as! UITabBarController
                   self.navigationController?.show(tabvc, sender: nil)
                   

               }
           }
        }
    }
    
//    -----------------------
    
    
    let dbStore = Firestore.firestore()

    func writeToFirestore(docId : String , tableNum  : String) {
//         save in order collection
        let doc = dbStore.collection("Orders").document()
        doc.updateData(["tableNum" : tableNum ])
//
    }
}
