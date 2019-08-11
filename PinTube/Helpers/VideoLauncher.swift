//
//  VideoLauncher.swift
//  PinTube
//
//  Created by Daval Cato on 8/10/19.
//  Copyright © 2019 Daval Cato. All rights reserved.
//

import UIKit


class VideoLauncher: NSObject {
    
    func showVideoPlayer() {
        print("Showing video player animation...")
        
        if let keyWindow = UIApplication.shared.keyWindow {
            let view = UIView(frame: keyWindow.frame)
            view.backgroundColor = UIColor.red
            
            keyWindow.addSubview(view)
        }
    }
}
