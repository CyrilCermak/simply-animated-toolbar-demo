//
//  Extensions.swift
//  Animations
//
//  Created by Cyril on 14/04/17.
//  Copyright © 2017 Cyril. All rights reserved.
//

import Foundation
import UIKit

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
    
    func zoomInAndOut() {
        self.transform = CGAffineTransform(scaleX: 1.0, y: 1.0)
        UIView.animate(withDuration: 0.5, delay: 0, options: .curveEaseIn, animations: {
            self.transform = CGAffineTransform(scaleX: 1.5, y: 1.5)
        }) { (completed) in
            if completed {
                UIView.animate(withDuration: 0.5, delay: 0, options: .curveEaseOut, animations: {
                   self.transform = CGAffineTransform(scaleX: 1.0, y: 1.0)
                }, completion: nil)
            }
        }
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
