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

class ArrowVC: AnimationsRootVC {
    
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

extension UIView {
    func rotate360() {
        let animation = CABasicAnimation(keyPath: "transform.rotation")
        animation.fromValue = 0.0
        animation.toValue = -CGFloat(M_PI*2.0)
        animation.duration = 1
        
        self.layer.add(animation, forKey: nil)
    }
    
    func fadeOut(completion:@escaping(_ completed:Bool)->Void) {
        UIView.animate(withDuration: 1, delay: 0, options: .curveEaseOut, animations: {
            self.alpha = 0
        }, completion: completion)

    }
    
    func fadeIn(completion:@escaping(_ completed:Bool) -> Void = {_ in}) {
        UIView.animate(withDuration: 1, delay: 0, options: .curveEaseIn, animations: {
            self.alpha = 1
        }, completion: completion)
    }
    
    func moveToTheRight(point: CGFloat) {
        let x = self.frame.origin.x
        let y = self.frame.origin.y
        UIView.animate(withDuration: 1, delay: 0, options: .curveEaseIn, animations: {
            self.frame.origin.x = point
            self.frame.origin.y = 0
        }, completion: { completed in
            if completed {                
                UIView.animate(withDuration: 1, delay: 0, options: .curveEaseIn, animations: {
                    self.frame.origin.x = x
                    self.frame.origin.y = y
                })
            }
        })
    }
}













