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
    
    
    @IBOutlet weak var msgLabel: UILabel!
    
    @IBOutlet weak var startBtn: UIButton!
    
    
    @IBOutlet weak var headerImgHeight: NSLayoutConstraint!
    
    var captureSession:AVCaptureSession?
    var videoPreviewLayer:AVCaptureVideoPreviewLayer?
    
    var qrCodeFrameView:UIView?
    
    var isReading: Bool = false

    override func viewDidLoad() {
        super.viewDidLoad()

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
        videoPreviewLayer?.frame = view.layer.bounds
        view.layer.addSublayer(videoPreviewLayer!)
        
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
                msgLabel.text = unwraped.stringValue
                startBtn.setTitle("Start", for: .normal)
                self.performSelector(onMainThread: #selector(stopReading), with: nil, waitUntilDone: false)
                isReading = false;
            }
        }
    }
    
    @IBAction func scanBtnAction(_ sender: Any) {
        
                if !isReading {
                    if (self.startReading()) {
                        startBtn.setTitle("Stop", for: .normal)
                        msgLabel.text = "Scanning for QR Code..."
                    }
                }
                else {
                    stopReading()
                    startBtn.setTitle("Start", for: .normal)
                }
                isReading = !isReading
    }

    @IBAction func backAction(_ sender: Any) {
        
        self.navigationController?.popViewController(animated: true)
    }
    

}
