//
//  LNavigationController.swift
//  swift_D
//
//  Created by idea on 2018/7/18.
//  Copyright © 2018年 idea. All rights reserved.
//

import UIKit

class LNavigationController: UINavigationController ,UIGestureRecognizerDelegate{

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationBar.barTintColor = Color(kAppColor);
        
        navigationBar.titleTextAttributes = [NSAttributedStringKey.font:UIFont.systemFont(ofSize: 17), NSAttributedStringKey.foregroundColor: UIColor.white]
        // Do any additional setup after loading the view.
        
        let target = self.interactivePopGestureRecognizer?.delegate
        let pan = UIPanGestureRecognizer(target: target, action: Selector(("handleNavigationTransition:")))
        pan.delegate = self
        self.view.addGestureRecognizer(pan)
        // 禁止使用系统自带的滑动手势
        self.interactivePopGestureRecognizer?.isEnabled = false;
    }
    
    func gestureRecognizerShouldBegin(_ gestureRecognizer: UIGestureRecognizer) -> Bool {
        if (self.childViewControllers.count == 1) {
            // 表示用户在根控制器界面，就不需要触发滑动手势，
            return false;
        }
        return true;
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
