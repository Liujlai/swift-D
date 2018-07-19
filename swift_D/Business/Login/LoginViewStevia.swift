//
//  LoginViewStevia.swift
//  swift_D
//
//  Created by idea on 2018/7/17.
//  Copyright © 2018年 idea. All rights reserved.
//


import UIKit
import Stevia
class LoginViewStevia: UIView {
    
    let validation = UILabel()
    let username = UITextField()
    let password = UITextField()
    let repeatedPassword = UITextField()
    let login = UIButton()
    
    convenience init() {
        self.init(frame: CGRect.zero)
        reder()
    }
    
    func reder() {
        sv(
            validation,
            username,
            password,
            repeatedPassword,
            login
        )
        
        layout(
            100,
            |-validation-| ~ 80,
            8,
            |-username-| ~ 80,
            8,
            |-password-| ~ 80,
            8,
            |-repeatedPassword-| ~ 80,
            "",
            |login| ~ 80,
            80
        )
        
        backgroundColor = UIColor.white
        validation.align(.center).font("26");
        username.style(commonFieldStyle)
        password.style(commonFieldStyle)
        repeatedPassword.style(commonFieldStyle).style { (f) in
            f.isSecureTextEntry = true
            f.returnKeyType = .done
        }
        login.backgroundColor = .lightGray
        username.placeholder = "账号"
        password.placeholder = "密码"
        repeatedPassword.placeholder = "确认密码"
        login.setTitle("登录", for: .normal)
    }
    func commonFieldStyle(_ f:UITextField)  {
        f.borderStyle = .roundedRect
        f.font = UIFont(name: "HelveticaNeue-Light", size: 26)
        f.returnKeyType = .next
    }
}
