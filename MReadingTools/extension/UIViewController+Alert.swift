//
//  UIViewController+Alert.swift
//  MReading
//
//  Created by seven on 2018/5/18.
//  Copyright © 2018年 innovate. All rights reserved.
//

import UIKit

extension UIViewController {
   public func alert(_ title: String?, message: String?, firstName: String?, firstAction: (() -> Void)?, secondName: String?, secondAction: (() -> Void)?) {
        DispatchQueue.main.async { [weak self] in
            let alertController = UIAlertController.init(title: title, message: message, preferredStyle: UIAlertController.Style.alert)
            if let name = firstName, name.count > 0 {
                if name == "取消" {
                    alertController.addAction(UIAlertAction.init(title: firstName, style: UIAlertAction.Style.cancel, handler: { (action) in
                        firstAction?()
                    }))
                }else {
                    alertController.addAction(UIAlertAction.init(title: firstName, style: UIAlertAction.Style.default, handler: { (action) in
                        firstAction?()
                    }))
                }
            }
            
            if let name = secondName, name.count > 0 {
                if name == "取消" {
                    alertController.addAction(UIAlertAction.init(title: secondName, style: UIAlertAction.Style.cancel, handler: { (action) in
                        secondAction?()
                    }))
                }else {
                    alertController.addAction(UIAlertAction.init(title: secondName, style: UIAlertAction.Style.default, handler: { (action) in
                        secondAction?()
                    }))
                }
            }
            self?.present(alertController, animated: true, completion: nil)
        }
    }
    
}
