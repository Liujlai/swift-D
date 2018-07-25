//
//  Reachability.swift
//  swift_D
//
//  Created by idea on 2018/7/25.
//  Copyright © 2018年 idea. All rights reserved.
//

import Foundation
import Alamofire

class Reachability {
  
    class func currentNetReachability() {
        let manager = NetworkReachabilityManager()
        manager?.listener = { status in
            var statusStr: String?
            switch status {
            case .unknown:
                statusStr = "未识别的网络"
                break
            case .notReachable:
                statusStr = "不可用的网络(未连接)"
            case .reachable:
                if (manager?.isReachableOnWWAN)! {
                    statusStr = "2G,3G,4G网络"
                } else if (manager?.isReachableOnEthernetOrWiFi)! {
                    statusStr = "wifi网络";
                }
                break
            }
    
            MBProgressHUD.showInfo(statusStr!)
           
        }
        manager?.startListening()


}
}
