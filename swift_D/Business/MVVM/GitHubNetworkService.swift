//
//  GitHubNetworkService.swift
//  swift_D
//
//  Created by idea on 2018/7/18.
//  Copyright © 2018年 idea. All rights reserved.
//

import RxSwift
import RxCocoa
import ObjectMapper

class GitHubNetworkService {
    
    //搜索资源数据
    func searchRepositories(query:String) -> Driver<GitHubRepositories> {
        return GitHubProvider.rx.request(.repositories(query))
            .filterSuccessfulStatusCodes()
            .mapObject(GitHubRepositories.self)
            .asDriver(onErrorDriveWith: Driver.empty())
    }
    
    //验证用户是否存在
    func usernameAvailable(_ username: String) -> Observable<Bool> {
        //通过检查这个用户的GitHub主页是否存在来判断用户是否存在
        let url = URL(string: "https://github.com/\(username.URLEscaped)")!
        let request = URLRequest(url: url)
        return URLSession.shared.rx.response(request: request)
            .map { pair in
                //如果不存在该用户主页，则说明这个用户名可用
                return pair.response.statusCode == 404
            }
            .catchErrorJustReturn(false)
    }
    //注册用户
    func signup(_ username: String, password: String) -> Observable<Bool> {
        //这里我们没有真正去发起请求，而是模拟这个操作（平均每3次有1次失败）
        let signupResult = arc4random() % 3 == 0 ? false : true
        return Observable.just(signupResult)
            .delay(1.5, scheduler: MainScheduler.instance) //结果延迟1.5秒返回
    }
}
//扩展String
extension String {
    //字符串的url地址转义
    var URLEscaped: String {
        return self.addingPercentEncoding(withAllowedCharacters: .urlHostAllowed) ?? ""
    }
}
