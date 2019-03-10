//
//  SettingCell.swift
//  PinTube
//
//  Created by Daval Cato on 3/7/19.
//  Copyright © 2019 Daval Cato. All rights reserved.
//

import UIKit

class SettingCell: BaseCell {
    
    var setting: Setting? {
        didSet {
            nameLabel.text = setting?.name
            
            if let imageName =  setting?.imageName {
                iconImageView.image = UIImage(named: imageName)
                
            }
            
        }
        
    }
    
    
    let nameLabel: UILabel = {
        let label = UILabel()
        label.text = "Setting"
        return label
        
    }()
    
    let iconImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "settings")
        imageView.contentMode = .scaleAspectFill
        return imageView
        
        
    }()
    
    override func setupViews() {
        super.setupViews()

        
        addSubview(nameLabel)
        addSubview(iconImageView)
        
        addConstraintsWithFormat(format: "H:|-8-[v0(30)]-8-[v1]|", views: iconImageView, nameLabel)
        
        addConstraintsWithFormat(format: "V:|[v0]|", views: nameLabel)
        
        addConstraintsWithFormat(format: "V:[v0(30)]", views: iconImageView)
        
        addConstraint(NSLayoutConstraint(item: iconImageView, attribute: .centerY, relatedBy: .equal, toItem: self, attribute: .centerY, multiplier: 1, constant: 0))
        
    }
}



















