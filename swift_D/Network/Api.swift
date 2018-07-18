//
//  Api.swift
//  NewPorject
//
//  Created by idea on 2018/4/24.
//  Copyright © 2018年 idea. All rights reserved.
//

import Foundation

import Moya
let ApiProvider = MoyaProvider<Model>()

public enum Model{
    case list
    case scores
    case JD
    case operation
    case channels
    case playlist(String)
}
extension Model:TargetType{
    //    服务器地址
    public var baseURL: URL {
        switch self {
        case .list, .scores, .operation:
            return URL(string: GfoodsUrl)!
        case .JD:
            return URL(string: kJD)!
        case .channels:
            return URL(string: "https://www.douban.com")!
        case .playlist(_):
            return URL(string: "https://douban.fm")!
            //        default:
        }
    }
    //    各个请求的具体路径
    public var path: String {
        switch self {
        case .list:
            return "app/index/list"
        case .scores:
            return "app/integral/login"
        case .operation:
            return "account/address/operation"
        case .JD:
            return "ApiSearch.php"
        case .channels:
            return "/j/app/radio/channels"
        case .playlist(_):
            return "/j/mine/playlist"
            //        default:
        }
    }
    //    请求类型
    public var method: Moya.Method {
        switch self {
        case .list, .scores, .channels,.playlist(_):
            return .get
        default:
            return .post
        }
        
    }
    //    这个是做单元测试的模拟数据，只在单元测试的文件中有作用
    public var sampleData: Data {
        return "{}".data(using: String.Encoding.utf8)!
    }
    //    请求任务事件
    public var task: Task {
        switch self {
        case .list, .scores:
            return .requestPlain
        case .operation:
            let param = ["opr":"search","data":["page":1,"limit":6,"cond":["id":" "]]] as [String : Any]
            return .requestParameters(parameters: param, encoding:JSONEncoding.default)
        case .JD:
            let param = ["ShipperCode":"JD","LogisticCode":"64587611799","OrderCode":""] as [String : Any]
            return .requestParameters(parameters: param, encoding: JSONEncoding.default)
            //        default:
            
        case .channels:
            return .requestPlain
        case .playlist(let channel):
            var params: [String: Any] = [:]
            params["channel"] = channel
            params["type"] = "n"
            params["from"] = "mainsite"
            return .requestParameters(parameters: params,
                                      encoding: URLEncoding.default)
        }
    }
    
    public var headers: [String : String]? {
        return ["Authorization":token]
    }
}
