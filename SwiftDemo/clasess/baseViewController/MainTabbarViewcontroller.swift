//
//  MainTabbarViewcontroller.swift
//  SwiftDemo
//
//  Created by 刘圣洁 on 2022/4/29.
//

import UIKit

class MainTabbarViewcontroller: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        let homeNav: MainNavigationController = self.configVC(vc: HomeVC(), title: "首页",image: "home",selectImageName: "home_select")
        let mineNav: MainNavigationController = self.configVC(vc: MineVC(), title: "我的",image: "mine",selectImageName: "mine_select")
        viewControllers = [homeNav,mineNav]
        selectedIndex = 0
        tabBar.backgroundColor = UIColor.white
        tabBar.tintColor = .purple
    }
    
    func configVC(vc : UIViewController,title : String,image : String,selectImageName : String) -> MainNavigationController{
        let nav = MainNavigationController(rootViewController: vc)
        vc.title = title
        nav.tabBarItem.image = UIImage(named: image)
        nav.tabBarItem.selectedImage = UIImage(named: selectImageName)!.withRenderingMode(.alwaysOriginal)
        nav.navigationBar.backgroundColor = UIColor.white
        return nav
    }

}
