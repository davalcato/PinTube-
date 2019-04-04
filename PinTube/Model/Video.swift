//
//  Video.swift
//  PinTube
//
//  Created by Daval Cato on 2/24/19.
//  Copyright © 2019 Daval Cato. All rights reserved.
//

import UIKit

class SafeJsonObjects: NSObject {
    
    override func setValue(_ value: Any?, forKey key: String) {
        let upperCaseFirstCharacter = String(key.characters.first!).uppercased()
        let range = key.startIndex..<key.index(key.startIndex, offsetBy: 1)
        let selectorString = key.replacingCharacters(in: range, with: upperCaseFirstCharacter)
        
        let selector = NSSelectorFromString("set\(selectorString):")
        let responds = self.responds(to: selector)
        
        if !responds {
            return
        }
        
        super.setValue(value, forKey: key)
    }
    
}


class Video: SafeJsonObjects {
    
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

class Channel: SafeJsonObjects {
    var name: String?
    var profile_image_name: String?
}



