//
//  ScanCodeViewController.swift
//  cafeApp_FinalProject
//
//  Created by نجود  on 20/05/1443 AH.
//

import UIKit
import AVFoundation

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
                   alert.addAction(UIAlertAction(title: "copy ", style: .default, handler: {(nil) in
                       UIPasteboard.general.string = object.stringValue
                   }))
                   present(alert, animated: true , completion: nil)
               }
               
               
           }
            
        }
    }
    
}
