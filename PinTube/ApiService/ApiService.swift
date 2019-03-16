//
//  ApiService.swift
//  PinTube
//
//  Created by Daval Cato on 3/15/19.
//  Copyright © 2019 Daval Cato. All rights reserved.
//

import UIKit

class ApiService: NSObject {
    
    static let sharedInstance = ApiService()
    
    func fetchVideos(completion: @escaping ([Video]) ->()) {
        let url = NSURL(string: "https://s3-us-west-2.amazonaws.com/youtubeassets/home.json")
        URLSession.shared.dataTask(with: url! as URL) { (data, respones, error) in
            
            if error != nil {
                print(error as Any)
                return
                
            }
            
            do {
                
                let json = try JSONSerialization.jsonObject(with: data!, options: .mutableContainers)
                
                var videos = [Video]()
                
                for dictionary in json as! [[String: AnyObject]] {
                    
                    let video = Video()
                    video.title = dictionary["title"] as? String
                    video.thumbnailImageName = dictionary["thumbnail_image_name"] as? String
                    
                    let channelDictionary = dictionary["channel"] as! [String: AnyObject]
                    
                    let channel = Channel()
                    channel.name = channelDictionary["name"] as? String
                    channel.profileImageName = channelDictionary["profile_image_name"] as? String
                    
                    video.channel = channel
                    
                    videos.append(video)
                    
                }
                
                DispatchQueue.main.async {
                  completion(videos)
                    
                }
                
            } catch let jsonError {
                print(jsonError)
                
            }
            
            }.resume()
        
    }
    

}
