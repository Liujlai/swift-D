//
//  ViewController.swift
//  swift_D
//
//  Created by idea on 2018/7/17.
//  Copyright © 2018年 idea. All rights reserved.
//

import UIKit

// MARK: - Router跳转
    /**
     Router代码现在封装在一个AppNavigation对象中。
     页面跳转，在Router/MyAppNavigation.swift中MyNavigation定义页面枚举
     在MyAppNavigation 中viewcontrollerForNavigation方法里写跳转对应文件
     
     如：
        navigate(.test)//跳转到test
     */
// MARK: - MD5加密
    /**
     //MD5加密
     Tools/ MD5Digest.swift
     
     如：
     //print("Stringsss".md5)
     */
// MARK: - Moya网络
    /**
     //网络请求
        在Network/中配置Moya
        在请求数目不太多
        根据tabbar的数来初始化Moya请求的provider
     */
// MARK: - 数据解析
    /**
     //数据解析
     在Test/下解析数据，绑定到tableView
     
     **另:**
     TestCell为自定义cell与解析数据无关
     */
// MARK: - 全局属性
    /**
     Common.swift
     */
// MARK: - HUD提示
    /**
     MBProgressHUD.swift
     */
// MARK: - 导航条和底部tabbar
    /**
     Base/LNavigationController.swift 导航条
     Base/LTabbarViewController.swift 底部tabbar
     */
// MARK: - swif和OC的桥接文件
    /**
     swift_D-Bridging-Header.h
     */

// MARK: -  Refresh
/**
    Refresh/
    上拉刷新和下拉加在
 
    例：
    Test/RefreshViewController.swift
 */
// MARK: -  页面加载数据时的一个动画
    /**
 
     BaseViewController.swift
    页面加载数据时的一个动画，有数据时
     */


