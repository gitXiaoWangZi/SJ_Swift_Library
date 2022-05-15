//
//  HomeModel.swift
//  SwiftDemo
//
//  Created by 刘圣洁 on 2022/5/15.
//

import UIKit
import SwiftyJSON

class HomeModel {
    var small_icon_url : String?
    var tag_name : String?
    var tag_id : String?
    var room_list : [roomItem]?
    var icon_url : String?
    
    
    init(jsonData:JSON) {
        small_icon_url = jsonData["small_icon_url"].stringValue
        tag_name = jsonData["tag_name"].stringValue
        tag_id = jsonData["tag_id"].stringValue
        var arr = [roomItem]()
        for value in jsonData["room_list"].arrayValue {
            let item = roomItem(jsonData: JSON(value))
            arr.append(item)
        }
        room_list = arr
        icon_url = jsonData["icon_url"].stringValue
    }
}

class roomItem {
    var game_name : String?
    var room_id : String?
    var vertical_src : String?
    var room_name : String?
    var nickname : String?
    
    init(jsonData:JSON) {
        game_name = jsonData["game_name"].stringValue
        room_id = jsonData["room_id"].stringValue
        vertical_src = jsonData["vertical_src"].stringValue
        room_name = jsonData["room_name"].stringValue
        nickname = jsonData["nickname"].stringValue
    }
}
