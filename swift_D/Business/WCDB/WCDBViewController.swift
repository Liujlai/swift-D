//
//  WCDBViewController.swift
//  swift_D
//
//  Created by idea on 2018/7/26.
//  Copyright © 2018年 idea. All rights reserved.
//

import UIKit
import WCDBSwift
class WCDBViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.bg(kWhiteColor);
//        创建数据库对象
        let database = Database(withPath: NSHomeDirectory()+"/sample.db")
//        创建数据库表
        // 以下代码等效于 SQL：CREATE TABLE IF NOT EXISTS sampleTable(identifier INTEGER, description TEXT)
        do {
            try database.create(table: "sampleTable", of: Sample.self)
        } catch let error {
            print(error)
        }
//        插入操作
        let object = Sample()
        object.isAutoIncrement = true  //当需要进行自增插入时，对象需设置 isAutoIncrement 参数为 true，则数据库会使用 已有数据中最大的值+1 作为主键的值。
        object.description = "sample_insert"
        //Insert
        do {
            try database.insert(objects: object, intoTable: "sampleTable")
        } catch let error {
            print(error)
        }
        
//        查找操作
        do {
            let objects: [Sample] = try database.getObjects(fromTable: "sampleTable")
            print(objects);
            MBProgressHUD.showInfo(objects[0].description!)
        } catch let error {
            print(error)
        }
////        更新操作
////        let object = Sample()
//        object.description = "sample_update"
//        //Update
//
//        do {
//            try database.update(table: "sampleTable",
//                                on: Sample.Properties.description,
//                                with: object,
//                                where: Sample.Properties.identifier > 0)
//        } catch let error {
//            print(error)
//        }
        
//        //        删除操作
        do {
            try database.delete(fromTable: "sampleTable")
        } catch let error {
            print(error)
        }
        
        let now = Date()
        let dformatter = DateFormatter()
        dformatter.dateFormat = "yyyy年MM月dd日 HH:mm:ss"
        let a = dformatter.string(from: now)
        
        print(now,a,Int(dformatter.date(from: a)!.timeIntervalSince1970))
        let timeInterval:TimeInterval = now.timeIntervalSince1970
        let timeStamp = Int(timeInterval)
        print("当前时间的时间戳：\(timeStamp)")
       
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
