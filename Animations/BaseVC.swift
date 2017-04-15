//
//  BaseVC.swift
//  Animations
//
//  Created by Cyril on 14/04/17.
//  Copyright © 2017 Cyril. All rights reserved.
//

import UIKit

class BaseVC: UIViewController {

    override func viewDidLoad() {
        print("Did appear: \(self.classForCoder)")
        super.viewDidLoad()
    }

}
