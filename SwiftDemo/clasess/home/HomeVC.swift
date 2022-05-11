//
//  HomeVC.swift
//  SwiftDemo
//
//  Created by 刘圣洁 on 2022/4/29.
//

import UIKit
import AVFoundation

class HomeVC: BaseViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        
        let barButton = UIBarButtonItem(barButtonSystemItem: .save, target: self, action: #selector(click))
        self.navigationItem.setRightBarButton(barButton, animated: true)
        let btn : UIButton
        
        btn = UIButton(type: .custom)
        btn.frame = CGRect(x: 100, y: 100, width: 100, height: 50)
        btn.setTitle("dd", for: .normal)
        btn.backgroundColor = UIColor.red
        btn.addTarget(self, action: #selector(click), for: .touchUpInside)
        self.view.addSubview(btn)
    }
    
    @objc func click(){
        self.navigationController?.pushViewController(HomeDetailVC(), animated: true)
    }
}
