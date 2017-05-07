//
//  Downloader.swift
//  GG1L1
//
//  Created by Ivan Vasilevich on 5/4/17.
//  Copyright © 2017 Smoosh Labs. All rights reserved.
//

import UIKit

let kBgQ = DispatchQueue.global(qos: .background)
let kMainQueue = DispatchQueue.main

let imageDownloadedNotification = "imageDownloadedNotification"

class Downloader: NSObject {
    
    static func downloadImage() -> UIImage {
        print("start", Date().timeIntervalSince1970)
        let url = URL.init(string: "https://akket.com/wp-content/uploads/2016/02/Instagram-account-2.jpg")!
        let data = try! Data.init(contentsOf: url)
        print("finish", Date().timeIntervalSince1970)
        
        return UIImage.init(data: data)!
    }
    
    static func downloadImageAndPostNotification() {
        print("start", Date().timeIntervalSince1970)
        let url = URL.init(string: "https://akket.com/wp-content/uploads/2016/02/Instagram-account-2.jpg")!
        kBgQ.async {
            let data = try! Data.init(contentsOf: url)
            print("finish", Date().timeIntervalSince1970)
            let image = UIImage.init(data: data)!
            kMainQueue.async {
                NotificationCenter.default.post(name: NSNotification.Name(rawValue: imageDownloadedNotification), object: nil, userInfo: ["image" : image])
            }
            
        }
        
        
    }
    
    static func downloadImageWithCallback(_ handler: ((UIImage) -> Swift.Void)? = nil) {
        kBgQ.async {
            let img = self.downloadImage()
            kMainQueue.async {
                handler?(img)
            }
        }
    }

}
