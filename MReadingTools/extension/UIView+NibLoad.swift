//
//  UIView+NibLoad.swift
//  MReading
//
//  Created by liyang on 2018/8/15.
//  Copyright © 2018年 innovate. All rights reserved.
//

import UIKit

extension UIView {
    //在协议里面不允许定义class 只能定义static
   public static func loadFromNib(_ nibname: String) -> UIView? {//Self (大写) 当前类对象
        //self(小写) 当前对象
        return Bundle.main.loadNibNamed(nibname, owner: nil, options: nil)?.first as? UIView
    }
}


