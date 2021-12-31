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

class ScanCodeViewController: UIViewController , AVCaptureMetadataOutputObjectsDelegate {
    var video = AVCaptureVideoPreviewLayer()


    override func viewDidLoad() {
        super.viewDidLoad()

        let session = AVCaptureSession()
//        --------
        
        do{
            guard let captureDevice = AVCaptureDevice.default(for: AVMediaType.video) else { return  }
            
          let input = try AVCaptureDeviceInput(device : captureDevice)
            session.addInput(input)
            
            
        }
        catch{
            print("error")
        }
        let output = AVCaptureMetadataOutput()
        session.addOutput(output)
        
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
               if object.type == AVMetadataObject.ObjectType.qr {
                   
                   
                   let alert = UIAlertController(title: "qr code", message: object.stringValue , preferredStyle: .alert)
                   
                   alert.addAction(UIAlertAction(title: "no ", style: .default, handler: nil))
                   alert.addAction(UIAlertAction(title: "ok ", style: .default, handler: {(nil) in
                       UIPasteboard.general.string = object.stringValue
                       
                       //
                       self.writeToFirestore(str: object.stringValue!)
                       let tabvc = self.storyboard?.instantiateViewController(withIdentifier: "tabid") as! UITabBarController
                       self.navigationController?.show(tabvc, sender: nil)
                       
                   }))
                   present(alert, animated: true , completion: nil)
               }
               
               
           }
            
        }
    }
    
    
    
    let dbStore = Firestore.firestore()


    func writeToFirestore(str : String) {
        dbStore.collection("Place").addDocument(
            data: ["url" : str])
    }
}