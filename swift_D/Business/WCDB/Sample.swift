//
//  Sample.swift
//  swift_D
//
//  Created by idea on 2018/7/26.
//  Copyright © 2018年 idea. All rights reserved.
//

import UIKit
import WCDBSwift
//class Sample {
//    var identifier: Int? = nil
//    var description: String? = nil
//}

class Sample: TableCodable {
    var identifier: Int? = nil
    var description: String? = nil
    
//    对于不需要写入数据库的字段，则不需要在 CodingKeys 内定义
    enum CodingKeys: String, CodingTableKey {
        typealias Root = Sample
        static let objectRelationalMapping = TableBinding(CodingKeys.self)
        case identifier = "id" //对于变量名与表的字段名不一样的情况，可以使用别名进行映射，如 case identifier = "id"
        case description
        
        static var columnConstraintBindings: [CodingKeys: ColumnConstraintBinding]? {
            return [
                identifier: ColumnConstraintBinding(isPrimary: true),    //定义了 isPrimary: 的字段，支持以自增的方式进行插入数据。
//
////                当需要进行自增插入时，对象需设置 isAutoIncrement 参数为 true，则数据库会使用 已有数据中最大的值+1 作为主键的值。
////            let autoIncrementObject = Sample()
////            autoIncrementObject.isAutoIncrement = true
////            
////            // 插入自增数据
////            try database.insert(objects: autoIncrementObject, intoTable: "sampleTable")
////            print(autoIncrementObject.lastInsertedRowID) // 输出 1
//                description: ColumnConstraintBinding(isNotNull: true, defaultTo: "defaultDescription"),
            ]
        }
    }
    var isAutoIncrement: Bool = false // 用于定义是否使用自增的方式插入
    var lastInsertedRowID: Int64 = 0 // 用于获取自增插入后的主键值
}
