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
    
    let email = UITextField()
    let password = UITextField()
    let login = UIButton()
    
    convenience init() {
        self.init(frame: CGRect.zero)
        reder()
    }
    
    func reder() {
        sv(
            email,
            password,
            login
        )
        
        layout(
            100,
            |-email-| ~ 80,
            8,
            |-password-| ~ 80,
            "",
            |login| ~ 80,
            80
        )
        
        backgroundColor = UIColor.white
        email.style(commonFieldStyle)
        password.style(commonFieldStyle).style { (f) in
            f.isSecureTextEntry = true
            f.returnKeyType = .done
        }
        login.backgroundColor = .lightGray
        email.placeholder = "Email"
        password.placeholder = "Password"
        login.setTitle("Login", for: .normal)
    }
    func commonFieldStyle(_ f:UITextField)  {
        f.borderStyle = .roundedRect
        f.font = UIFont(name: "HelveticaNeue-Light", size: 26)
        f.returnKeyType = .next
    }
}
