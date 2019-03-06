//
//  SettingsLauncher.swift
//  PinTube
//
//  Created by Daval Cato on 3/5/19.
//  Copyright © 2019 Daval Cato. All rights reserved.
//

import UIKit

class SettingsLauncher: NSObject {
    
    let blackView = UIView()
    
    @objc func showSettings() {
        //show menu
        
        if let window = UIApplication.shared.keyWindow {
            blackView.backgroundColor = UIColor.init(white: 0, alpha: 0.5)
            
            blackView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(handleDismiss)))
            
            window.addSubview(blackView)
            
            blackView.frame = window.frame
            blackView.alpha = 0
            
            UIView.animate(withDuration: 0.5) {
                self.blackView.alpha = 1
            }
            
        }
        
    }
    
    @objc func handleDismiss() {
        UIView.animate(withDuration: 0.5) {
            self.blackView.alpha = 0
        }
        
    }
    
    
    override init() {
        super.init()
        //execute code here in the future 
    }
}
