//
//  HomeViewController.swift
//  swift_D
//
//  Created by idea on 2018/7/28.
//  Copyright © 2018年 idea. All rights reserved.
//

import UIKit
import SwiftyUserDefaults
class HomeViewController: UIViewController {

    lazy var scrollView: StackScrollView = {
        let scrollView = StackScrollView()
        scrollView.delegate = self
        
        return scrollView
    }()
    var models: [StackModel] = {
        let models = [
            StackModel(title: "已上市系列", desc: "2018春夏", imageUrl: "http://img5.adesk.com/57d7d601fce12b0f8f1c997e?imageMogr2/thumbnail/!1440x2392r/gravity/Center/crop/1440x2392&adult=false.png"),
            StackModel(title: "发布会", desc: "2018/19秋冬", imageUrl: "http://img5.adesk.com/5800b3eefce12b4b3309f90c?imageMogr2/thumbnail/!1440x2392r/gravity/Center/crop/1440x2392&adult=false.png"),
            StackModel(title: "已上市系列", desc: "2018春夏预告系列", imageUrl: "http://img5.adesk.com/59c5d143e7bce77b1b837f62?imageMogr2/thumbnail/!1440x2392r/gravity/Center/crop/1440x2392&adult=false.png"),
            StackModel(title: "已上市系列", desc: "眼睛系列广告大片", imageUrl: "http://img5.adesk.com/573e92e6fce12b3b4f2163a9?imageMogr2/thumbnail/!1440x2392r/gravity/Center/crop/1440x2392&adult=false.png"),
            StackModel(title: "HAUTE COUTURE", desc: "2018春夏", imageUrl: "http://img5.adesk.com/5a61a281e7bce736a953c2ca?imageMogr2/thumbnail/!1440x2392r/gravity/Center/crop/1440x2392&adult=false.png")
        ];
        return models;
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = #colorLiteral(red: 0.2392156869, green: 0.6745098233, blue: 0.9686274529, alpha: 1)
        
        view.addSubview(scrollView)
        scrollView.makeCons { (make) in
            make.edge.equal(view)
        }
        
        scrollView.reloadData(lives: models)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

}
// MARK: - delegate
extension HomeViewController: StackScrollViewDelegate {
    func stackScrollViewBtnDidClick(view: StackScrollView, model: StackModel) {
        print("点击了\(model.title!)");
        Defaults[.username] = "joe"
        MBProgressHUD.showInfo(Defaults[.username]!)
        navigate(.login)//跳转到test
    }
}
