//
//  UINavigationController+BarStyle.swift
//  MReading
//
//  Created by seven on 2018/5/26.
//  Copyright © 2018年 innovate. All rights reserved.
//

import UIKit
import Foundation

extension UINavigationController {
    
    open override var childForStatusBarStyle: UIViewController? {
        return viewControllers.last
    }
    
    open override var childForStatusBarHidden: UIViewController? {
        return viewControllers.last
    }
    
}

