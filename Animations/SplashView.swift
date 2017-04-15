//
//  SplashView.swift
//  Animations
//
//  Created by Cyril on 15/04/17.
//  Copyright © 2017 Cyril. All rights reserved.
//

import UIKit

class SplashView: UIView {

    @IBOutlet var imageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        imageView.backgroundColor = .black
    }
    
}
