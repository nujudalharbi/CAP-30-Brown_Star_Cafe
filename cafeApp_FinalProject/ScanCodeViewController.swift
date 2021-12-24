//
//  ScanCodeViewController.swift
//  cafeApp_FinalProject
//
//  Created by نجود  on 20/05/1443 AH.
//

import UIKit
import AVFoundation

class ScanCodeViewController: UIViewController , AVCaptureMetadataOutputObjectsDelegate {
    var videoPreviewLayer : AVCaptureVideoPreviewLayer?
    var captureSession = AVCaptureSession()
    var qrCodeFrame : UIView!
    
    func metadataOutput(_ output: AVCaptureMetadataOutput, didOutput metadataObjects: [AVMetadataObject], from connection: AVCaptureConnection) {
        
        if metadataObjects.count == 0 {
            
            qrCodeFrame.frame = .zero
            
            print ("No code found ")
            return
        }
        let metadataObject = metadataObjects[0] as! AVMetadataMachineReadableCodeObject
        if metadataObject.type == .qr {
            
            let barCodeObject = videoPreviewLayer?.transformedMetadataObject(for: metadataObject)
            qrCodeFrame.frame = barCodeObject!.bounds
            
            
            if metadataObject.stringValue != nil{
                print ("code value is == \(metadataObject.stringValue)")
            }
         
        }
        
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    
//        Define capture devcie
//        let captureDevice = AVCaptureDevice.defaultDevice(withMediaType: AVMediaTypeVideo)
//
//        do {
//            let input = try AVCaptureDeviceInput(device: captureDevice)
//            session.addInput(input)
//        }
//        catch{}
        
        initalizeQRScanner()
    }
    private func initalizeQRScanner(){
//      1-
        let discoverySession = AVCaptureDevice.DiscoverySession(deviceTypes: [.builtInDualCamera] , mediaType: .video , position: .back)
        guard let captureDevice = discoverySession.devices.first else{
            
            print ("No device found ")
            return
        }
        
        
        do {
            let input = try AVCaptureDeviceInput(device: captureDevice)
            captureSession.addInput(input)
//            2
            let videoMetaDataOutput = AVCaptureMetadataOutput()
            captureSession.addOutput(videoMetaDataOutput)
            
//            3 delegate method
            
            videoMetaDataOutput.setMetadataObjectsDelegate(self, queue: DispatchQueue.main)
            
            videoMetaDataOutput.metadataObjectTypes = [.qr]
            
//            4
            videoPreviewLayer = AVCaptureVideoPreviewLayer(session: captureSession)
            videoPreviewLayer?.videoGravity = .resizeAspectFill
            videoPreviewLayer?.frame = view.layer.bounds
            
            
            view.layer.addSublayer(videoPreviewLayer!)
            
            qrCodeFrame = UIView()
            
            if qrCodeFrame == qrCodeFrame {
                
                qrCodeFrame.layer.borderColor = UIColor.green.cgColor
                qrCodeFrame.layer.borderWidth = 2.0
                view.addSubview(qrCodeFrame)
                view.bringSubviewToFront(qrCodeFrame)
                
            }
            captureSession.startRunning()
            
            
        }
        catch{
            
            print (error)
            return
        }
        
        
    }
    
    
  
    


}
