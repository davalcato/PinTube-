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
    var uploadDate: NSDate?
    var duraction: NSNumber?
    
    
    var channel: Channel?
    
//    var num_likes: NSNumber?
    
}

class Channel: NSObject {
    var name: String?
    var profile_image_name: String?
    
    
}



