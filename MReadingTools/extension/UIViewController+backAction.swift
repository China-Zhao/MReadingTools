//
//  UIViewController+backAction.swift
//  MReading
//
//  Created by seven on 2018/6/29.
//  Copyright © 2018年 innovate. All rights reserved.
//

import Foundation
import UIKit

extension UIViewController{
    @objc public func viewControllerBackAction() {
        self.navigationController?.popViewController(animated: true)
    }
    
    
    ///  进入阅读口味设置
//    func mr_pushReadToastVC(_ status: Bool) {
//        if status {
//            let vc = UIStoryboard.init(name: "mr_classify", bundle: Bundle.main).instantiateViewController(withIdentifier: "MRClassifyViewController") as? MRClassifyViewController
//            vc?.title = "阅读口味"
//            vc?.hidesBottomBarWhenPushed = true
//            vc?.hiddenNavigation = false
//            vc?.entranceType = .readHabit
//            navigationController?.pushViewController(vc!, animated: true)
//        } else {
//            let vc = UIStoryboard.init(name: "start", bundle: Bundle.main).instantiateViewController(withIdentifier: "MRStartViewController")
//            vc.hidesBottomBarWhenPushed = true
//            (vc as? MRStartViewController)?.isFromMine = true
//            navigationController?.pushViewController(vc, animated: true)
//        }
//    }
}
