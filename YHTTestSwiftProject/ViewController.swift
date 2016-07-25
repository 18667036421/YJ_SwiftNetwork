//
//  ViewController.swift
//  YHTTestSwiftProject
//
//  Created by yht1 on 16/7/22.
//  Copyright © 2016年 yht1. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        //验证网络请求的值是否正确
        YJNetwork.yj_sharedNetwork.yj_getJSON("http://www.baokan.name/e/api/getNewsList.php", paramters: nil) { (success, response, error) in
            for model in response!{
                print(model.id)
                print(model.morepic)
            }
        }
    }

    


}

