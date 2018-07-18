//
//  LoginViewController.swift
//  swift_D
//
//  Created by idea on 2018/7/17.
//  Copyright © 2018年 idea. All rights reserved.
//

import UIKit
import Cupcake

class LoginViewController: UIViewController {

    var v = LoginViewStevia()
    override func loadView() {
        view = v
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        v.login.onClick { (_) in
            self.login()
        }
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func login() {
        print("login")
        MBProgressHUD.showInfo("login")
        navigate(.test)//跳转到test

    }
   

}
