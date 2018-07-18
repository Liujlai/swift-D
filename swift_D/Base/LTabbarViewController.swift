//
//  TabbarViewController.swift
//  swift_D
//
//  Created by idea on 2018/7/18.
//  Copyright © 2018年 idea. All rights reserved.
//

import UIKit
import Cupcake
class LTabbarViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        tabBar.tintColor = Color(kAppColor)
        tabBar.backgroundImage = UIImage(named: "pfb_tabbar_background")
        // 添加自控制器
        addChildControllers()
        // Do any additional setup after loading the view.
    }
    
    // MARK: - 添加子控制器
    func addChildControllers() {
        addChildController(LoginViewController(), title: "首页", imageName: "pfb_tabbar_homepage")
        addChildController(TestViewController(), title: "发现", imageName: "pfb_tabbar_order")
        addChildController(LoginViewController(), title: "消息", imageName: "pfb_tabbar_discover")
        addChildController(TestViewController(), title: "我的", imageName: "pfb_tabbar_mine")
    }
    
    // MARK: 添加子控制器
    public func addChildController(_ childController:UIViewController , title:String , imageName:String){
        childController.title = title
        childController.tabBarItem.image = UIImage(named: imageName)
        childController.tabBarItem.selectedImage = UIImage(named: imageName + "_selected")
        let navigationVC = LNavigationController (rootViewController: childController)
        addChildViewController(navigationVC)
        
    }


}
