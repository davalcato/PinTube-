//
//  SettingCell.swift
//  PinTube
//
//  Created by Daval Cato on 3/7/19.
//  Copyright © 2019 Daval Cato. All rights reserved.
//

import UIKit

class SettingCell: BaseCell {
    
    let nameLabel: UILabel = {
        let label = UILabel()
        label.text = "Setting"
        return label
        
    }()
    
    override func setupViews() {
        super.setupViews()
        
        
        addSubview(nameLabel)
        
        addConstraintsWithFormat(format: "H:|[v0]|", views: nameLabel)
        addConstraintsWithFormat(format: "V:|[v0]|", views: nameLabel)
    }
}



















