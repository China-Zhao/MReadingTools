//
//  UIView+Toast.swift
//  MReading
//
//  Created by seven on 2018/5/18.
//  Copyright © 2018年 innovate. All rights reserved.
//

import Foundation
import UIKit
import ToastSwiftFramework
import NVActivityIndicatorView

extension UIView {
    public func toast(_ message: String, point: CGPoint? = nil) {
        if point == nil {
            let y = self.frame.height - 49 - 32 - 32
            let x = center.x
            self.makeToast(message, point: CGPoint.init(x: x, y: y), title: nil, image: nil, completion: nil)
        }else {
            self.makeToast(message, point: point!, title: nil, image: nil, completion: nil)
        }
    }
    
    public func showWaitForToast(_ message: String) {
        makeToastActivity(ToastPosition.center)
    }
    
    public func hidenWaitForToast() {
        hideToastActivity()
    }
}


extension UIViewController: NVActivityIndicatorViewable {
    static let theme = "#1C89ED"

    public func showLoading() {
        startAnimating(CGSize.init(width: 30, height: 30), type: NVActivityIndicatorType.ballRotateChase, color: UIColor.init(hex: UIViewController.theme))
    }
    
    public func hidenLoading() {
        stopAnimating(nil)
    }
}
