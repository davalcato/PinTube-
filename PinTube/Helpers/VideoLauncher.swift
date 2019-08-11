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
            
            view.frame = CGRect(x: keyWindow.frame.width - 10, y: keyWindow.frame.height - 10, width: 10, height: 10)
            
            
            keyWindow.addSubview(view)
            
            UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 1, options: .curveEaseOut, animations: {
                
                view.frame = keyWindow.frame
                
                
            }) { (completedAnimation) in
                //The view is expected to rise from the lower right corner later....
            }
        }
    }
}
