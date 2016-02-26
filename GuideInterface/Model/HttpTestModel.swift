//
//  HttpTestModel.swift
//  GuideInterface
//
//  Created by 佐毅 on 16/2/25.
//  Copyright © 2016年 上海乐住信息技术有限公司. All rights reserved.
//

import UIKit

class HttpTestModel: NSObject {


    var success: Bool = false

    var data: [Data]?
    
}


class Data: NSObject {

    var bed: Bed?

    var area: String?

    var bathRoomType: String?

    var roomTypeName: String?

    var valueaddedfa: [String]?

    var roomTypeId: Int = 0

    var roomTypePic: [Roomtypepic]?

    var infrastructure: [Infrastructure]?

    var dynamicPrice: Int = 0

}

class Bed: NSObject {

    var beds: [Beds]?

    var count: Int = 0

}

class Beds: NSObject {

    var name: String?

    var length: String?

}

class Roomtypepic: NSObject {

    var name: String?

    var pic: [Pic]?

}

class Pic: NSObject {

    var url: String?

}

class Infrastructure: NSObject {

    var id: Int = 0

    var name: String?

}

