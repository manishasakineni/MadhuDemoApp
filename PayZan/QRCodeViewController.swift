//
//  QRCodeViewController.swift
//  PayZan
//
//  Created by N@n!'$ Mac on 13/12/17.
//  Copyright © 2017 CalibrageMac02. All rights reserved.
//

import UIKit
import AVFoundation

class QRCodeViewController: UIViewController,AVCaptureMetadataOutputObjectsDelegate {
    
    //MARK:- OutLets
 
    
    @IBOutlet weak var msgLabel: UILabel!
    
    @IBOutlet weak var startBtn: UIButton!
    
    @IBOutlet weak var scanView: UIView!
    
    @IBOutlet weak var headerImgHeight: NSLayoutConstraint!
    
    //MARK:- Variables

    
    var captureSession:AVCaptureSession?
    var videoPreviewLayer:AVCaptureVideoPreviewLayer?
    
    var qrCodeFrameView:UIView?
    
    var isReading: Bool = false

    override func viewDidLoad() {
        super.viewDidLoad()
        
        scanView.isHidden = true

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
    
    //MARK:- startReading
    

    
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
        scanView.isHidden = false
        videoPreviewLayer = AVCaptureVideoPreviewLayer(session: captureSession)
        videoPreviewLayer?.videoGravity = AVLayerVideoGravityResizeAspectFill
        videoPreviewLayer?.frame = scanView.layer.bounds
        scanView.layer.addSublayer(videoPreviewLayer!)
        
        /* Check for metadata */
        let captureMetadataOutput = AVCaptureMetadataOutput()
        captureSession?.addOutput(captureMetadataOutput)
        captureMetadataOutput.metadataObjectTypes = captureMetadataOutput.availableMetadataObjectTypes
        print(captureMetadataOutput.availableMetadataObjectTypes)
        captureMetadataOutput.setMetadataObjectsDelegate(self, queue: DispatchQueue.main)
        captureSession?.startRunning()
        
        return true
    }
    
    //MARK:- stopReading
    
    func stopReading() {
        captureSession?.stopRunning()
        scanView.isHidden = true
        captureSession = nil
        videoPreviewLayer?.removeFromSuperlayer()
    }
    
    //MARK:- captureOutput
    
    func captureOutput(_ captureOutput: AVCaptureOutput!, didOutputMetadataObjects metadataObjects: [Any]!, from connection: AVCaptureConnection!) {
        for data in metadataObjects {
            let metaData = data as! AVMetadataObject
            print(metaData.description)
            let transformed = videoPreviewLayer?.transformedMetadataObject(for: metaData) as? AVMetadataMachineReadableCodeObject
            if let unwraped = transformed {
                print(unwraped.stringValue)
                msgLabel.text = unwraped.stringValue
                startBtn.setTitle("Start", for: .normal)
                self.performSelector(onMainThread: #selector(stopReading), with: nil, waitUntilDone: false)
                isReading = false;
            }
        }
    }
     //MARK:- button Actions
    
    @IBAction func scanBtnAction(_ sender: Any) {
        
                if !isReading {
                    if (self.startReading()) {
                        startBtn.setTitle("Stop", for: .normal)
                        scanView.isHidden = false
                        msgLabel.text = "Scanning for QR Code..."
                    }
                }
                else {
                    stopReading()
                    scanView.isHidden = true
                    startBtn.setTitle("Start", for: .normal)
                }
                isReading = !isReading
    }

    @IBAction func backAction(_ sender: Any) {
        
        self.navigationController?.popViewController(animated: true)
    }
    

}
