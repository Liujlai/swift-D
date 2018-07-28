//
//  MineViewController.swift
//  swift_D
//
//  Created by idea on 2018/7/20.
//  Copyright © 2018年 idea. All rights reserved.
//

import UIKit

class MineViewController: BaseViewController {
    //       自定义数据
    public var arr = [String]()
    let data = Observable.just([
        "分类管理",
        "商品",
        "联系客服",
        "设置",
        ])
    
    //       懒加载tableView
    fileprivate lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.frame = CGRect(x: 0,
                                 y: kNavBarH+kStatusH,
                                 width: kScreenW,
                                 height: kScreenH-kNavBarH-kStatusH)
        tableView.tableFooterView = UIView()
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        return tableView
    }()
    
    //        tableHeaderView
    fileprivate lazy var mineView: MineView = {
       let mineView = MineView()
        mineView.frame = CGRect(x: 0, y: kNavBarH+kStatusH, width: kScreenW, height: 160)
        return mineView
    }()
    
    override func setupUI() {
        //        定义cell 将数据绑定到表格
        data.bind(to: tableView.rx.items){(tableView,row,element) in
            let cell = tableView.dequeueReusableCell(withIdentifier: "cell")!
            cell.textLabel?.text = "\(element)"
            cell.imageView?.img("pfb_tabbar_discover_selected")
            cell.accessoryType = .disclosureIndicator //行末加箭头
            return cell
            }.disposed(by: disposeBag)
//        点击cell
        tableView.rx.itemSelected.subscribe(onNext: { [weak self] indexPath in
            self?.navigate(.WCDB)
        }).disposed(by: disposeBag)

            self.loadDataFinished()
        super.setupUI()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.bg(kWhiteColor)
        view.addSubview(tableView)
        tableView.tableHeaderView = mineView
        setupText()
        mineView.onClick {[weak self]_ in 
            self?.push()
        }
    }
//    绑定数据
    fileprivate func setupText() {
        mineView.name.text = "张三"
        mineView.tel.text = "17855555555"
    }
//    传值跳转
    func push(){
        navigate(.test("🤔🤔传值跳转🤔🤔"))
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

   

}
