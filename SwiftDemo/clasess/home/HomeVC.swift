//
//  HomeVC.swift
//  SwiftDemo
//
//  Created by 刘圣洁 on 2022/4/29.
//

import UIKit
import AVFoundation
import Alamofire
import SwiftyJSON

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
        
        reloadData()
        
    }
    
    func reloadData() {
        let interval = Int(NSDate().timeIntervalSince1970)
        let str = "\(interval)"
        Alamofire.request("http://capi.douyucdn.cn/api/v1/getHotCate", method: .get, parameters: ["limit":"4","offset":"0","time":str]).responseJSON { (response) in
            guard let result = response.result.value else {
                print("请求失败")
                return
            }
            guard let resultDic = result as? [String : NSObject] else {return}
            guard let resultArr = resultDic["data"] as? Array<Any> else {return}
            var arr = [HomeModel]()
            for value in resultArr {
                var model = HomeModel(jsonData: JSON(value))
                arr.append(model)
            }
            print(arr)
        }
    }
    
    @objc func click(){
//        self.navigationController?.pushViewController(HomeDetailVC(), animated: true)
        let url = URL(string: "lsj://?token=12dn&id=32")
        if UIApplication.shared.canOpenURL(url!) {
            if #available(iOS 10.0, *) {
                UIApplication.shared.open(url!)
            } else {
                // Fallback on earlier versions
            }
        }
    }
}
