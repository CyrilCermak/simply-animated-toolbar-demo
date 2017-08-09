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

class HomeVC: BaseVC, UITableViewDelegate, UITableViewDataSource {
    
    let imageView = UIImageView(image: UIImage(named: "arrow"))
    var tableView: UITableView!
    var isExpanded = false
    var selectedIndexPaths = Set<IndexPath>()
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        self.initArrow()
        self.initTableView()
        self.view.backgroundColor = .gray
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
    
    fileprivate func initTableView() {
        self.tableView = UITableView(frame: self.view.frame , style: .grouped)
        self.tableView.delegate = self
        self.tableView.dataSource = self
        self.tableView.register(UINib(nibName: "TextCell", bundle: nil), forCellReuseIdentifier: "cell")
        self.tableView.rowHeight = 120
        self.tableView.separatorColor = .clear
        
        self.view.addSubview(self.tableView)
        self.tableView.snp.makeConstraints { (make) in
            make.left.equalTo(self.view)
            make.right.equalTo(self.view)
            make.bottom.equalTo(self.view)
            make.top.equalTo(self.view)
        }
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        //if self.selectedIndexPaths.contains(indexPath) { return }
        cell.alpha = 0
        cell.frame.origin.x = -self.view.frame.width
        UIView.animate(withDuration: 0.6, animations: {
            cell.alpha = 1
            cell.frame.origin.x = 0
        })
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell")! as! TextCell
        cell.bottomImage?.isHidden = self.selectedIndexPaths.contains(indexPath) ? false : true
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        if self.selectedIndexPaths.contains(indexPath){
            self.isExpanded = false
            self.selectedIndexPaths.remove(indexPath)
        } else {
            self.isExpanded = true
            self.selectedIndexPaths.insert(indexPath)
        }
        self.tableView.reloadRows(at: [indexPath], with: .automatic)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return self.selectedIndexPaths.contains(indexPath) ? 300 : 120
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
