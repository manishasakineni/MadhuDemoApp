//
//  LanguageViewController.swift
//  PayZan
//
//  Created by N@n!'$ Mac on 11/12/17.
//  Copyright © 2017 CalibrageMac02. All rights reserved.
//

import UIKit
import AVFoundation

class LanguageViewController: UIViewController,AVCaptureMetadataOutputObjectsDelegate {
    
    var captureSession:AVCaptureSession?
    var videoPreviewLayer:AVCaptureVideoPreviewLayer?
    
     var qrCodeFrameView:UIView?
    
    var isReading: Bool = false
    
    @IBOutlet weak var headerImgHeight: NSLayoutConstraint!
    
    
    @IBOutlet weak var messageLabel: UILabel!
    
    @IBOutlet weak var scannerAreaImageView: UIImageView!

    @IBOutlet weak var navigationBarView: UIView!
    
    @IBOutlet weak var btnStartStop: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiom.pad) {
            
            headerImgHeight.constant = 150
        }
        else {
            
            headerImgHeight.constant = 79
            
        }
//       inetializeCamera()
        
//        navigationBarView.layer.cornerRadius = 5;
//        btnStartStop.layer.cornerRadius = 5;
//        captureSession = nil;
//        messageLabel.text = "Barcode discriptio...";

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func startReading() -> Bool {
        let captureDevice = AVCaptureDevice.defaultDevice(withMediaType: AVMediaTypeVideo)
        do {
            let input = try AVCaptureDeviceInput(device: captureDevice)
            captureSession = AVCaptureSession()
            captureSession?.addInput(input)
            // Do the rest of your work...
        } catch let error as NSError {
            // Handle any errors
            print(error)
            return false
        }
        
        videoPreviewLayer = AVCaptureVideoPreviewLayer(session: captureSession)
        videoPreviewLayer?.videoGravity = AVLayerVideoGravityResizeAspectFill
        videoPreviewLayer?.frame = navigationBarView.layer.bounds
        navigationBarView.layer.addSublayer(videoPreviewLayer!)
        
        /* Check for metadata */
        let captureMetadataOutput = AVCaptureMetadataOutput()
        captureSession?.addOutput(captureMetadataOutput)
        captureMetadataOutput.metadataObjectTypes = captureMetadataOutput.availableMetadataObjectTypes
        print(captureMetadataOutput.availableMetadataObjectTypes)
        captureMetadataOutput.setMetadataObjectsDelegate(self, queue: DispatchQueue.main)
        captureSession?.startRunning()
        
        return true
    }
    
    func stopReading() {
        captureSession?.stopRunning()
        captureSession = nil
        videoPreviewLayer?.removeFromSuperlayer()
    }
    
    func captureOutput(_ captureOutput: AVCaptureOutput!, didOutputMetadataObjects metadataObjects: [Any]!, from connection: AVCaptureConnection!) {
        for data in metadataObjects {
            let metaData = data as! AVMetadataObject
            print(metaData.description)
            let transformed = videoPreviewLayer?.transformedMetadataObject(for: metaData) as? AVMetadataMachineReadableCodeObject
            if let unwraped = transformed {
                print(unwraped.stringValue)
                messageLabel.text = unwraped.stringValue
                btnStartStop.setTitle("Start", for: .normal)
                self.performSelector(onMainThread: #selector(stopReading), with: nil, waitUntilDone: false)
                isReading = false;
            }
        }
    }
    
    func inetializeCamera(){
        let captureDevice = AVCaptureDevice.defaultDevice(withMediaType: AVMediaTypeVideo)
        do {
            let input = try AVCaptureDeviceInput(device: captureDevice)
            captureSession = AVCaptureSession()
            captureSession?.addInput(input)
            let captureMetadataOutput = AVCaptureMetadataOutput()
            captureSession?.addOutput(captureMetadataOutput)
            captureMetadataOutput.setMetadataObjectsDelegate(self, queue: DispatchQueue.main)
            captureMetadataOutput.metadataObjectTypes = [AVMetadataObjectTypeQRCode]
            videoPreviewLayer = AVCaptureVideoPreviewLayer(session: captureSession)
            videoPreviewLayer?.videoGravity = AVLayerVideoGravityResizeAspectFill
            videoPreviewLayer?.frame = view.layer.bounds
            view.layer.addSublayer(videoPreviewLayer!)
            captureSession?.startRunning()
            
            view.bringSubview(toFront: messageLabel)
            view.bringSubview(toFront: navigationBarView)
            view.bringSubview(toFront: scannerAreaImageView)
            qrCodeFrameView = UIView()
            if let qrCodeFrameView = qrCodeFrameView {
                qrCodeFrameView.layer.borderColor = UIColor.green.cgColor
                qrCodeFrameView.layer.borderWidth = 2
                view.addSubview(qrCodeFrameView)
                view.bringSubview(toFront: qrCodeFrameView)
            }
        } catch {
            print(error)
            return
        }
    }
    
//    func captureOutput(_ captureOutput: AVCaptureOutput!, didOutputMetadataObjects metadataObjects: [Any]!, from connection: AVCaptureConnection!) {
//        if metadataObjects == nil || metadataObjects.count == 0 {
//            qrCodeFrameView?.frame = CGRect.zero
//            print("No QR code is detected")
//            return
//        }
//        let metadataObj = metadataObjects[0] as! AVMetadataMachineReadableCodeObject
//        if metadataObj.type == AVMetadataObjectTypeQRCode {
//            let barCodeObject = videoPreviewLayer?.transformedMetadataObject(for: metadataObj)
//            qrCodeFrameView?.frame = barCodeObject!.bounds
//            if metadataObj.stringValue != nil {
//                qrCodeFrameView?.frame = CGRect.zero
//                print(metadataObj.stringValue)
//                
//            }
//        }
//    }
    
    
    @IBAction func english(_ sender: Any) {
        
       self.changeToLanguage("en")
        

        
        
       
    }
    
    func failed() {
        let ac = UIAlertController(title: "Scanning not supported", message: "Your device does not support scanning a code from an item. Please use a device with a camera.", preferredStyle: .alert)
        ac.addAction(UIAlertAction(title: "OK", style: .default))
        present(ac, animated: true)
        captureSession = nil
    }
    
    
    
    @IBAction func telugu(_ sender: Any) {
        
        self.changeToLanguage("te")
    }
    
    
    @IBAction func sinhala(_ sender: Any) {
        
        self.changeToLanguage("si")
    }
    
    
    @IBAction func Tamil(_ sender: Any) {
        
        self.changeToLanguage("ta")
    }

    private  func changeToLanguage(_ langCode : String) {
        
        if Bundle.main.preferredLocalizations.first != langCode{
            
            
            let alertController = UIAlertController(title: "restartTitle", message:
                "Good Morning Everyone!", preferredStyle: UIAlertControllerStyle.alert)
            
            //   alertController.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default))
            
            
            alertController.title = NSLocalizedString("restartTitle", comment: "")
            alertController.message = NSLocalizedString("restart", comment: "")
            
            let confirmation  = UIAlertAction(title : NSLocalizedString("OK", comment: ""), style: .default){   _ in
                
                UserDefaults.standard.set([langCode], forKey: "AppleLanguages")
                UserDefaults.standard.synchronize()
                  exit(EXIT_SUCCESS)
                
                
                
            }
            
            alertController.addAction(confirmation)
            
            let cancelAction = UIAlertAction(title : NSLocalizedString("Cancel", comment: ""), style: .cancel , handler : nil)
            
            alertController.addAction(cancelAction)
            
            present(alertController, animated: true, completion: nil)
            
            
            
            
        }
        
        
    }
    
    
    @IBAction func backAction(_ sender: Any) {
        
        self.navigationController?.popViewController(animated: true)
    }

}
