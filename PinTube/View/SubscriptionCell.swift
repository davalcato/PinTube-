//
//  SubscriptionCell.swift
//  PinTube
//
//  Created by Daval Cato on 3/18/19.
//  Copyright © 2019 Daval Cato. All rights reserved.
//

import UIKit
import AVKit

class SubscriptionCell: FeedCell {

    override func fetchVideos() {
        ApiService.sharedInstance.fetchSubscriptionFeed { (videos) in
            self.videos = videos
            self.collectionView.reloadData()
        }
    }
}

class ViewController: UIViewController {
    
    override func viewDidLoad() {
         super.viewDidLoad()
        
        
        // here is where we start up the camera
        
        let captureSession = AVCaptureSession()
        captureSession.sessionPreset = .photo
        
        guard let captureDevice = AVCaptureDevice.default(for: .video) else { return}
        guard let input = try? AVCaptureDeviceInput(device: captureDevice) else { return }
        captureSession.addInput(input)
        
        captureSession.startRunning()
        
        let previewLayer = AVCaptureVideoPreviewLayer(session: captureSession)
        
        view.layer.addSublayer(previewLayer)
        previewLayer.frame = view.frame
        
    }
    
}
