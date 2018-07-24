//
//  MineView.swift
//  swift_D
//
//  Created by idea on 2018/7/20.
//  Copyright © 2018年 idea. All rights reserved.
//

import UIKit
import Stevia
class MineView: UIView {
    let icon = UIImageView()
    let name = UILabel()
    let tel  = UILabel()
    
    convenience init() {
        self.init(frame: CGRect.zero)
        reder()
    }
    func reder(){

        HStack(
            icon.bg(kRandom+",0.5")     //随机颜色+0.5的透明度
                .pin(100,100)            //宽高都为100
                .radius(-1),            //高度一半的圆角
            VStack(
                "<-->",
                name.style(commonLabelStyle),
                15,
                tel.style(commonLabelStyle),
                "<-->"
            )
        ).embedIn(self,30)
    }
 
    func commonLabelStyle(_ l:UILabel){
        l.font = UIFont(name: "HelveticaNeue-Light", size: 16)
        l.margin(0,-15)
    }
}
