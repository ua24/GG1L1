//
//  SecondViewController.swift
//  GG1L1
//
//  Created by Ivan Vasilevich on 5/4/17.
//  Copyright © 2017 Smoosh Labs. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        UserDefaults.standard.set(arc4random()%234, forKey: "numb")
    }

}
