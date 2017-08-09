//
//  SplashScreenVC.swift
//  Animations
//
//  Created by Cyril on 15/04/17.
//  Copyright © 2017 Cyril. All rights reserved.
//

import Foundation
import UIKit
import SKSplashView

class SplashScreenVC: UIViewController {
    
    var timer: Timer!
    let imageView = UIImageView(image: UIImage(named: "ucl"))
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        self.view.addSubview(imageView)
        imageView.snp.makeConstraints { (make) in
            make.height.equalTo(126)
            make.width.equalTo(101)
            make.center.equalTo(self.view)
        }
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.timer = Timer(timeInterval: 3, target: self, selector: #selector(proceedAnimation), userInfo: nil, repeats: false)
        self.timer.fire()
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        print("Disappeared")
    }
    
    override func loadView() {
        self.view = UIView(frame: UIScreen.main.bounds)
    }
    
    @objc fileprivate func proceedAnimation() {
        self.imageView.transform = CGAffineTransform(scaleX: 1.0, y: 1.0)
        UIView.animate(withDuration: 1, delay: 0, animations: {
            self.imageView.transform = CGAffineTransform(scaleX: 5.0, y: 5.0)
            self.imageView.alpha = 0
        }, completion: { completed in
            if completed {
                self.navigationController?.pushViewController(AnimationsRootVC(), animated: false)
            }
        })
    }
    
}
