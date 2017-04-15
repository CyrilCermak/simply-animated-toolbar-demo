//
//  SettingsVC.swift
//  Animations
//
//  Created by Cyril on 15/04/17.
//  Copyright © 2017 Cyril. All rights reserved.
//

import Foundation
import UIKit

class SettingsVC: BaseVC {
    
    var imageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        addRotatingImage()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        self.rotateImage()
    }
    
    override func loadView() {
        self.view = UIView()
    }
    
    fileprivate func addRotatingImage() {
        let image = UIImage(named: "settings")
        image?.withRenderingMode(.alwaysTemplate)
        imageView = UIImageView(image: image)
        imageView.isUserInteractionEnabled = true
        imageView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(didTapOnImage)))
        self.view.addSubview(imageView)
        
        imageView.snp.makeConstraints { (make) in make.center.equalTo(self.view) }
    }
    
    fileprivate func rotateImage() {
        imageView.rotate360()
    }
    
    @objc func didTapOnImage() {
        rotateImage()
    }
    
}
