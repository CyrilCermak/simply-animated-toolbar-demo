//
//  ArrowVC.swift
//  Animations
//
//  Created by Cyril on 13/04/17.
//  Copyright © 2017 Cyril. All rights reserved.
//

import Foundation
import UIKit
import SnapKit

class HomeVC: BaseVC {
    
    let imageView = UIImageView(image: UIImage(named: "arrow"))
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.initArrow()
    }
    
    fileprivate func initArrow() {
        imageView.isUserInteractionEnabled = true
        imageView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(didTapImage)))
        
        self.view.addSubview(imageView)
        imageView.snp.makeConstraints { (make) in
            make.center.equalTo(self.view)
            make.width.equalTo(100)
            make.height.equalTo(100)
        }
        
    }
    
    @objc func didTapImage() {
        ///self.rotate360
        print("DidTapTheImage")
        //self.imageView.rotate360()
//        self.imageView.fadeOut() { completed in
//            if completed {
//                self.imageView.fadeIn()
//            }
//        }
        self.imageView.moveToTheRight(point: -20)
    }
    
}
