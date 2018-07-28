//
//  Common.swift
//  swift_D
//
//  Created by idea on 2018/7/18.
//  Copyright © 2018年 idea. All rights reserved.
//

import Foundation
import UIKit
// MARK: - @_exported
//@_exported import关键字导入,这样就可以全局通用了
@_exported import Cupcake
@_exported import RxSwift
@_exported import RxCocoa
//屏幕的宽度
let kScreenW = UIScreen.main.bounds.size.width
//屏幕的高度
let kScreenH = UIScreen.main.bounds.size.height
//是否是真机
let isIPhone: Bool = {
    return (UI_USER_INTERFACE_IDIOM() == .phone)
}()
//判断设备是不是iPhoneSE
let kisSE = UIScreen.main.bounds.width == 320
//判断设备是不是iPhoneX
let kisX = UIScreen.main.bounds.height == 812
let kTabBarH = CGFloat(kisX ? (49.0+34.0) : 49.0)
let kStatusH = CGFloat(kisX ? (44.0) : 20.0)
let kNavBarH = CGFloat(44.0)
/// RxSwift 回收池
let disposeBag = DisposeBag()
//颜色
let kAppColor    = "#00C6B0"
let kLineColor   = "#a8a8a8"
let kWhiteColor  = "#ffffff"
let kShadowColor = "#4a4a4a"
let kRandom     = "random" //随机颜色
//环境地址
let GfoodsUrl = "https://www.365greenlife.com/api/tiptop/v1/"
let token = "  "
let kJD = "http://139.199.169.203/"
