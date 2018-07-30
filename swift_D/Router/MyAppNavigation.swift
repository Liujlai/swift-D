//
//  MyAppNavigation.swift
//  swift_D
//
//  Created by idea on 2018/7/17.
//  Copyright © 2018年 idea. All rights reserved.
//

import UIKit


enum MyNavigation: Navigation {
    case login
    case test(String)
    case gitHub
    case mine
    case WCDB
    case Animations
    
//    case profile(Person)
}
struct MyAppNavigation: AppNavigation {
    
    func viewcontrollerForNavigation(navigation: Navigation) -> UIViewController {
        if let navigation = navigation as? MyNavigation {
            switch navigation {
            case .login:
                return LoginViewController()
            case .test(let a):
                let v = TestViewController()
                v.str = a
                return v
//            case .profile(let p):
//                return ProfileViewController(person: p)
            case .gitHub:
                return GitHubViewController()
            case .mine:
                return MineViewController()
            case .WCDB:
                return WCDBViewController()
            case .Animations:
                return AnimationsExampleController()
            }
        }
        return UIViewController()
    }
    
    func navigate(_ navigation: Navigation, from: UIViewController, to: UIViewController) {
        from.navigationController?.pushViewController(to, animated: true)
    }
}
extension UIViewController {
    
    func navigate(_ navigation: MyNavigation) {
        navigate(navigation as Navigation)
    }
}
