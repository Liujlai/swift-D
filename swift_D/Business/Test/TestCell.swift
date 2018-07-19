//
//  TestCell.swift
//  swift_D
//
//  Created by idea on 2018/7/17.
//  Copyright © 2018年 idea. All rights reserved.
//

import UIKit
import Stevia
class TestCell: UITableViewCell {

    let avatar = UIImageView()
    let name = UILabel()
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        sv(
            avatar,
            name.style(nameStyle)
        )
        avatar.size(50).centerVertically()
        align(horizontally:|-20-avatar-name-20-|)
    }
    func nameStyle(l:UILabel){
        l.font(24).color("cyan")
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
