//
//  Video.swift
//  PinTube
//
//  Created by Daval Cato on 2/24/19.
//  Copyright © 2019 Daval Cato. All rights reserved.
//

import UIKit

class Video: NSObject {
    
    var thumbnail_image_name: String?
    var title: String?
    var number_of_views: NSNumber?
    var duration: NSNumber?
   
//    var uploadDate: NSDate?
    
    
    
    var channel: Channel?
    
    override func setValue(_ value: Any?, forKey key: String) {
        if key == "channel" {
            //call some custom channel setup
            self.channel = Channel()
            self.channel?.setValuesForKeys(value as! [String: AnyObject])

        } else {
            super.setValue(value, forKey: key)
        }
    }
    
     init(dictionary: [String: AnyObject]) {
        super.init()
        setValuesForKeys(dictionary)
        
    }
}

class Channel: NSObject {
    var name: String?
    var profile_image_name: String?
}



