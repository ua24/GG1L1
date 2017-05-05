//
//  ViewController.swift
//  GG1L1
//
//  Created by Ivan Vasilevich on 5/4/17.
//  Copyright © 2017 Smoosh Labs. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
//        NotificationCenter.default.addObserver(self, selector: #selector(imageDownloaded(notification:)), name: NSNotification.Name(rawValue: imageDownloadedNotification), object: nil)
        NotificationCenter.default.addObserver(forName: NSNotification.Name(rawValue: imageDownloadedNotification), object: nil, queue: .main) { (notification) in
            let picture = notification.userInfo!["image"] as! UIImage
            //        sender.setImage(picture, for: .normal)
            self.view.backgroundColor = UIColor.init(patternImage: picture)
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
                NotificationCenter.default.addObserver(self, selector: #selector(imageDownloaded(notification:)), name: UserDefaults.didChangeNotification, object: nil)    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        
        NotificationCenter.default.removeObserver(self)
        
    }
    
    
    func imageDownloaded(notification: Notification) {
        print(notification)
//        let picture = notification.userInfo!["image"] as! UIImage
        //        sender.setImage(picture, for: .normal)
//        view.backgroundColor = UIColor.init(patternImage: picture)
    }
    
    @IBAction func buttonPressed(_ sender: UIButton) {
//        let picture = Downloader.downloadImage()
////        sender.setImage(picture, for: .normal)
//        view.backgroundColor = UIColor.init(patternImage: picture)
        
        Downloader.downloadImageAndPostNotification()
    }
    
    

}

