//
//  YJNetwork.swift
//  YHTTestSwiftProject
//
//  Created by yht1 on 16/7/22.
//  Copyright © 2016年 yht1. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class YJNetwork: NSObject {
    //类属性实现单例
    static let yj_sharedNetwork = YJNetwork()
    //定义回调的block，以便拿到数据
    typealias NetworkBlock = (success: Bool,response: [ArticleModel]?,error: NSError?)->()
    //封装好的网络请求，可以直接拿到所需数据
    func yj_getJSON(ApiString: String,paramters: [String: AnyObject]?,finishedBlock:NetworkBlock){
        Alamofire.request(.GET, ApiString, parameters: paramters).responseJSON { (response) -> Void in
            if let data = response.data{
                //将data转化成JSON
                let dict = JSON(data: data)
                var array = [ArticleModel]()
                if dict["err_msg"].string == "success"{
                    
                    for destDict in dict["data"][0].arrayValue{
                        let  model = ArticleModel()
                        print(destDict.dictionaryObject?["morepic"])
                        model.setValuesForKeysWithDictionary(destDict.dictionaryObject!)
                        //model中含model的解析
                        if model.morepic?.count > 0{
                            var dictArray = [MorepicModel]()
                            for destDict2 in model.morepic!{
                                let model1 = MorepicModel()
                                model1.setValuesForKeysWithDictionary(destDict2 as! [String : AnyObject])
                                dictArray.append(model1)
                            }
                            model.morepic? = dictArray
                        }
                        array.append(model)
                    }
                    finishedBlock(success: true,response: array,error: nil)
                    
                }else{
                    finishedBlock(success: false, response: nil, error: response.result.error)
                }
            }else{
                finishedBlock(success: false,response: nil,error: response.result.error)
            }
        }
    
    }
    
    
    
}
