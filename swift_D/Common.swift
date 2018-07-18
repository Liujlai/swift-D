//
//  Common.swift
//  swift_D
//
//  Created by idea on 2018/7/18.
//  Copyright © 2018年 idea. All rights reserved.
//

import Foundation
import UIKit
import Cupcake
//屏幕的宽度
let kScreenW = UIScreen.main.bounds.size.width
//屏幕的高度
let kScreenH = UIScreen.main.bounds.size.height
//判断设备是不是iPhoneSE
let kisSE = UIScreen.main.bounds.width == 320
//判断设备是不是iPhoneX
let kisX = UIScreen.main.bounds.height == 812
let kTabBarH = CGFloat(kisX ? (49.0+34.0) : 49.0)


let kAppColor = "#00C6B0";

let GfoodsUrl = "https://www.365greenlife.com/api/tiptop/v1/"
let token = "  "
let kJD = "http://139.199.169.203/"
