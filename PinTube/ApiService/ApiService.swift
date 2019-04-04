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
    
    let baseUrl = "https://s3-us-west-2.amazonaws.com/youtubeassets"
    
    func fetchVideos(completion: @escaping ([Video]) ->()) {
        fetchFeedForUrlString(urlString: "\(baseUrl)/home.json") { (videos) in
            completion(videos)
        }
        
        fetchFeedForUrlString(urlString: "\(baseUrl)/home.json", completion: completion)
    }
    
    func fetchTrendingFeed(completion: @escaping ([Video]) ->()) {
        fetchFeedForUrlString(urlString: "\(baseUrl)/trending.json", completion: completion)
        
    }
    
    func fetchSubscriptionFeed(completion: @escaping ([Video]) ->()) {
        fetchFeedForUrlString(urlString: "\(baseUrl)/subscriptions.json", completion: completion)
        
    }
    
    func fetchFeedForUrlString(urlString: String, completion: @escaping ([Video]) ->()) {
        let url = NSURL(string: urlString)
        URLSession.shared.dataTask(with: url! as URL) { (data, respones, error) in
            
            if error != nil {
                print(error as Any)
                return
                
            }
            
            do {
                if let unwrappedData = data, let jsonDictionaries = try JSONSerialization.jsonObject(with: unwrappedData, options: .mutableContainers) as? [[String: AnyObject]] {
                    
                    DispatchQueue.main.async {
                        completion(jsonDictionaries.map({return Video(dictionary: $0)}))
                    }
                    
                }
                
            } catch let jsonError {
                print(jsonError)
                
            }
            
            }.resume()
    }
    
}

//let json = try JSONSerialization.jsonObject(with: data!, options: .mutableContainers)
//
//var videos = [Video]()
//
//for dictionary in json as! [[String: AnyObject]] {
//
//    let video = Video()
//    video.title = dictionary["title"] as? String
//    video.thumbnailImageName = dictionary["thumbnail_image_name"] as? String
//
//    let channelDictionary = dictionary["channel"] as! [String: AnyObject]
//
//    let channel = Channel()
//    channel.name = channelDictionary["name"] as? String
//    channel.profileImageName = channelDictionary["profile_image_name"] as? String
//
//    video.channel = channel
//
//    videos.append(video)
//
//}
//
//DispatchQueue.main.async {
//    completion(videos)
//
//}
