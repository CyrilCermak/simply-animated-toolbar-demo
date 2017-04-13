//
//  ViewController.swift
//  Animations
//
//  Created by Cyril on 13/04/17.
//  Copyright © 2017 Cyril. All rights reserved.
//

import UIKit
import SnapKit

class AnimationsRootVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.initToolbar()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()

    }

    override func loadView() {
        self.view = UIView(frame: UIScreen.main.bounds)
    }
    
    fileprivate func initToolbar() {
        let toolbar = UIToolbar()
        toolbar.backgroundColor = .white
        let arrow = UIBarButtonItem(title: "Arrow", style: .plain, target: self, action: #selector(self.buttonTapped))
        let space = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        toolbar.items = [space,arrow,space]
        
        self.view.addSubview(toolbar)
        toolbar.snp.makeConstraints { (make) in
            make.left.leading.equalTo(self.view)
            make.right.trailing.equalTo(self.view)
            make.bottom.equalTo(self.view)
        }
    }

    @objc func buttonTapped() {
        self.navigationController?.pushViewController(ArrowVC(), animated: false)
        
    }
    
}

