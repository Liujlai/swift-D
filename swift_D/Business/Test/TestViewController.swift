//
//  TestViewController.swift
//  swift_D
//
//  Created by idea on 2018/7/17.
//  Copyright © 2018年 idea. All rights reserved.
//

import UIKit
class TestViewController: BaseViewController {
    var str:String = ""
    var tableView:UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "音乐"
        setupUI()
        loadData()
        print(str)
    }
    //    弹出提示
    func showAlert(title:String,message:String){
        Alert.title(title).message(message).action("确定").show()
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}
//MARK： 设置UI界面
extension TestViewController{
    override func setupUI() {
        contenView = self.tableView
        self.tableView = UITableView(frame: self.view.frame, style: .plain)
        self.tableView.register(TestCell.self, forCellReuseIdentifier: "cell")
        self.tableView.estimatedRowHeight = UITableViewAutomaticDimension
        self.view.addSubview(self.tableView)
        
        super.setupUI()
    }
}

//MARK: 请求数据
extension TestViewController{
    fileprivate func loadData(){
        let networkService = DoubanNetworkService()
        
        let data = networkService.loadChannels()
        //        定义cell 将数据绑定到表格
        data.bind(to: tableView.rx.items){(tableView,row,element) in
            let cell = tableView.dequeueReusableCell(withIdentifier: "cell")!
            cell.textLabel?.text = "\(element.name!)"
            cell.imageView?.img("pfb_tabbar_discover_selected")
            cell.accessoryType = .disclosureIndicator //行末加箭头
            return cell
            }.disposed(by: disposeBag)
        //        cell点击
        tableView.rx.modelSelected(Channel.self)
            .map { $0.channelId! }
            .flatMap(networkService.loadFirstSong)
            .subscribe(onNext: { [weak self] song in
                let message = "歌手：\(song.artist!)\n歌曲：\(song.title!)"
                self?.showAlert(title:"歌曲信息",message:message)
            }).disposed(by: disposeBag)
//        //            3.数据请求完成
//        self.loadDataFinished()
        
        DispatchQueue.global(qos: .default).asyncAfter(deadline: DispatchTime.now()+2.0){
            //执行完毕，主线程更新
            DispatchQueue.main.async {
                self.loadDataFinished()
            }
        }
    }
}

