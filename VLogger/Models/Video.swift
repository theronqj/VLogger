//
//  Video.swift
//  VLogger
//
//  Created by TJ on 3/26/19.
//  Copyright © 2019 TJ. All rights reserved.
//

import UIKit

class Video: NSObject {
    let url: URL
    let thumbURL: URL
    let title: String
    let subtitle: String
    
    init(url: URL, thumbURL: URL, title: String, subtitle: String) {
        self.url = url
        self.thumbURL = thumbURL
        self.title = title
        self.subtitle = subtitle
        super.init()
    }
    
    class func localVideos() -> [Video] {
        var videos: [Video] = []
        let names = ["newYorkFlip", "bulletTrain", "monkey", "shark"]
        let titles = ["New York Flip", "Bullet Train Adventure", "Monkey Village", "Robot Battles"]
        let subtitles =  ["Can this guys really flip all of his friends? Check it out...",
                          "Enjoying the view of passing towns in Japan",
                          "Watch as a gang of monkeys terrorizes the top of this mountain!",
                          "Have you ever seen a robot shark try to eat another robot?"]
        
        for (index, name) in names.enumerated() {
            let urlPath = Bundle.main.path(forResource: name, ofType: "mp4")!
            let url = URL(fileURLWithPath: urlPath)
            let thumbURLPath = Bundle.main.path(forResource: name, ofType: "png")!
            let thumbURL = URL(fileURLWithPath: thumbURLPath)
            
            let video = Video(url: url, thumbURL: thumbURL, title: titles[index], subtitle: subtitles[index])
            videos.append(video)
        }
        return videos
    }
    
    class func allVideos() -> [Video] {
        var videos = localVideos()
        let videoURLString = "https://wolverine.raywenderlich.com/content/ios/tutorials/video_streaming/foxVillage.m3u8"
        if let url = URL(string: videoURLString) {
            let thumbURLPath = Bundle.main.path(forResource: "foxVillage", ofType: "png")!
            let thumbURL = URL(fileURLWithPath: thumbURLPath)
            let remoteVideo = Video(url: url, thumbURL: thumbURL, title: "キツネ村", subtitle: "Will we be mauled by vicious foxes? Tune in to find out!")
            videos.append(remoteVideo)
        }
        
        return videos
    }
}
