//
//  ArticleModel.swift
//  YHTTestSwiftProject
//
//  Created by yht1 on 16/7/22.
//  Copyright © 2016年 yht1. All rights reserved.
//

import UIKit

class ArticleModel: NSObject {

    var username : String?
    var onclick : String?
    var newstime : String?
    var created_at : String?
    var id : String?
    var title : String?
    var titlepic : String?
    var smalltext : String?
    var table : String?
    var bclassid : String?
    var classid : String?
    var classname : String?
    var plnum : String?
    var piccount : Int = 0
    var morepic : [AnyObject]?
    var offsetY : CGFloat = 0
    var rowHeight : CGFloat = 0.0
    
    override func setValue(value: AnyObject?, forUndefinedKey key: String) {}
    
}
