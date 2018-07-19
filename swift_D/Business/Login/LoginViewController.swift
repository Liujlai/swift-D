//
//  LoginViewController.swift
//  swift_D
//
//  Created by idea on 2018/7/17.
//  Copyright © 2018年 idea. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa
class LoginViewController: UIViewController {

    var v = LoginViewStevia()
    let disposeBag = DisposeBag()
    override func loadView() {
        view = v
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        v.login.onClick { (_) in
            self.login()
        }
        
        let viewModel = GitHubSignupViewModel(
            input: (
                username: v.username.rx.text.orEmpty.asDriver(),
                password: v.password.rx.text.orEmpty.asDriver(),
                repeatedPassword: v.repeatedPassword.rx.text.orEmpty.asDriver(),
                loginTaps: v.login.rx.tap.asSignal()
            ),
            dependency: (
                networkService: GitHubNetworkService(),
                signupService: GitHubSignupService()
            )
        )
        //用户名验证结果绑定
        viewModel.validatedUsername
            .drive(v.validation.rx.validationResult)
            .disposed(by: disposeBag)
        //密码验证结果绑定
        viewModel.validatedPassword
            .drive(v.validation.rx.validationResult)
            .disposed(by: disposeBag)
        //再次输入密码验证结果绑定
        viewModel.validatedPasswordRepeated
            .drive(v.validation.rx.validationResult)
            .disposed(by: disposeBag)
        //注册按钮是否可用
        viewModel.signupEnabled
            .drive(onNext: { [weak self] valid  in
                self?.v.login.isEnabled = valid
                self?.v.login.alpha = valid ? 1.0 : 0.3
            })
            .disposed(by: disposeBag)
        //注册结果绑定
        viewModel.signupResult
            .drive(onNext: { [unowned self] result in
                self.showMessage("注册" + (result ? "成功" : "失败") + "!")
            })
            .disposed(by: disposeBag)
        // Do any additional setup after loading the view.
    }
    //详细提示框
    func showMessage(_ message: String) {
         Alert.message(message).action("确定").show()
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
