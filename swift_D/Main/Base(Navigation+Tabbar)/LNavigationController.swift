//
//  LNavigationController.swift
//  swift_D
//
//  Created by idea on 2018/7/18.
//  Copyright © 2018年 idea. All rights reserved.
//

import UIKit

class LNavigationController: UINavigationController {

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationBar.barTintColor = Color(kAppColor);
        
        navigationBar.titleTextAttributes = [NSAttributedStringKey.font:UIFont.systemFont(ofSize: 17), NSAttributedStringKey.foregroundColor: UIColor.white]
        // Do any additional setup after loading the view.
    }
    
    // MARK: - 重写 pushViewController 方法
    override func pushViewController(_ viewController: UIViewController, animated: Bool) {
        if viewControllers.count > 0 {
            viewController.hidesBottomBarWhenPushed = true
            viewController.navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(named: "icon_back"), style:  UIBarButtonItemStyle.plain, target: self, action: #selector(navigationBackClick))
        }
        super.pushViewController(viewController, animated: true)
    }
    
    // MARK: - 返回按钮
    @objc func navigationBackClick() {
//        // 隐藏提示框
//        if SVProgressHUD.isVisible() {
//            SVProgressHUD.dismiss()
//        }
        // 隐藏指示器
        if UIApplication.shared.isNetworkActivityIndicatorVisible {
            UIApplication.shared.isNetworkActivityIndicatorVisible = false
        }
        // pop 出页面
        popViewController(animated: true)
    }

}
