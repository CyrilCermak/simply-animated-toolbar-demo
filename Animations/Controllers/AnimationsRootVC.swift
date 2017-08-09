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

    let containerView = UIView()
    let toolbar = UIToolbar()
   
    var homeItem = UIBarButtonItem()
    var profileItem = UIBarButtonItem()
    var settingsItem = UIBarButtonItem()
    var indicatorView = UIView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.initToolbar()
        self.createContainer()
        self.showhomeVC()
    }
    
    override func loadView() {
        self.view = UIView(frame: UIScreen.main.bounds)
    }
    
    fileprivate func createContainer() {
        self.containerView.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(containerView)
        self.containerView.backgroundColor = .red
        containerView.snp.makeConstraints { (make) in
            make.left.leading.equalTo(self.view)
            make.right.trailing.equalTo(self.view)
            make.top.equalTo(self.view)
            make.bottom.equalTo(self.view).offset(-44)
        }
    }
    
    fileprivate func initToolbar() {
        
        self.homeItem = UIBarButtonItem()
        let homeView = self.createImageView(withImageName: "home", andSelector: #selector(self.showhomeVC))
        self.homeItem.customView = homeView
        
        self.profileItem = UIBarButtonItem()
        let profileView = self.createImageView(withImageName: "profile", andSelector: #selector(self.showProfileVC) )
        profileItem.customView = profileView
        
        self.settingsItem = UIBarButtonItem()
        let settingsView = self.createImageView(withImageName: "settings", andSelector: #selector(self.showSettingsVC))
        settingsItem.customView = settingsView
        
        let space = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        
        ///Setting up items HERE
        toolbar.items = [space, homeItem, space, profileItem, space, settingsItem, space]
        toolbar.backgroundColor = .white
        self.view.addSubview(toolbar)
        toolbar.snp.makeConstraints { (make) in
            make.left.leading.equalTo(self.view)
            make.right.trailing.equalTo(self.view)
            make.bottom.equalTo(self.view)
        }
        
        toolbar.addSubview(indicatorView)
        indicatorView.backgroundColor = .red
        indicatorView.snp.makeConstraints { (make) in
            make.left.equalTo(self.homeItem.customView!).offset(-20)
            make.right.equalTo(self.homeItem.customView!).offset(20)
            make.height.equalTo(5)
            make.bottom.equalTo(self.toolbar)
        }
    }
    
    fileprivate func createImageView(withImageName name: String, andSelector  selector: Selector) -> UIImageView {
        let image = UIImage(named: name)!
        let tintedImage = image.withRenderingMode(.alwaysTemplate)
        let imageView = UIImageView(image: tintedImage)
        imageView.isUserInteractionEnabled = true
        imageView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: selector))
        return imageView
    }
    
    @objc fileprivate func showhomeVC() {
        self.moveIndicatorTo(itemView: self.homeItem.customView!)
        self.addVCToContainer(HomeVC())
    }
    
    @objc fileprivate func showProfileVC() {
        self.moveIndicatorTo(itemView: self.profileItem.customView!)
        self.addVCToContainer(ProfileVC())
    }

    @objc fileprivate func showSettingsVC() {
        self.moveIndicatorTo(itemView: self.settingsItem.customView!)
        self.addVCToContainer(SettingsVC())
    }
    
    fileprivate func addVCToContainer(_ vc: UIViewController) {
        vc.view.translatesAutoresizingMaskIntoConstraints = false
        self.containerView.subviews.forEach({ $0.removeFromSuperview() })
        
        UIView.transition(with: containerView, duration: 1.0, options: .transitionCrossDissolve, animations: {
            self.containerView.addSubview(vc.view)
            self.addChildViewController(vc)
            vc.view.snp.makeConstraints { (make) in make.edges.equalTo(self.containerView) }
            vc.didMove(toParentViewController: self)
        }, completion: nil)
        
    }
    
    fileprivate func moveIndicatorTo(itemView: UIView) {
        self.makeDefaultImageColors()
        self.indicatorView.snp.remakeConstraints { (make) in
            make.left.equalTo(itemView).offset(-20)
            make.right.equalTo(itemView).offset(20)
            make.height.equalTo(5)
            make.bottom.equalTo(self.toolbar)
        }
        
        UIView.animate(withDuration: 1, animations: {
            self.toolbar.layoutIfNeeded()
        }, completion: { completed in
            if completed {
                if let imageView = itemView as? UIImageView {
                    imageView.tintColor = .red
                    imageView.zoomInAndOut()
                }
            }
        })
    }
    
    fileprivate func makeDefaultImageColors() {
        for item in [self.homeItem, self.profileItem, self.settingsItem] {
            if let imageView = item.customView as? UIImageView {
                if imageView.tintColor == UIColor.red {
                    UIView.animate(withDuration: 2, delay: 0, options: .curveEaseOut, animations: {
                        imageView.tintColor = .black
                    }, completion: nil)
                } else {
                    imageView.tintColor = .black
                }
            }
        }
    }
    
}

