//
//  MReadingAlert.swift
//  MReading
//
//  Created by seven on 2018/5/18.
//  Copyright © 2018年 innovate. All rights reserved.
//

import UIKit
import Foundation

/// 获取当前显示的Controller
///
/// - Returns: 返回当前显示Controller
func topVC() -> UIViewController? {
    let root = UIApplication.shared.keyWindow?.rootViewController
    if root?.isKind(of: UITabBarController.self) == true {
        return (root as? UITabBarController)?.selectedViewController
    }
    return root
}

func tabbar() -> UIViewController? {
    let root = UIApplication.shared.keyWindow?.rootViewController
    return root
}

//获取当前的vc
func currentViewController() ->UIViewController? {
    let window = UIApplication.shared.keyWindow
    var vc = window?.rootViewController
    if vc?.presentedViewController != nil {
        while ((vc?.presentedViewController) != nil) {
            vc = vc?.presentedViewController
            if vc is UINavigationController {
                vc = (vc as! UINavigationController).visibleViewController
            } else if vc is UITabBarController {
                vc = (vc as! UITabBarController).selectedViewController
                if vc is UINavigationController {
                    vc = (vc as! UINavigationController).visibleViewController
                }
            }
        }
        
    } else {
        if vc is UINavigationController {
            vc = (vc as! UINavigationController).visibleViewController
        } else if vc is UITabBarController {
            vc = (vc as! UITabBarController).selectedViewController
            if vc is UINavigationController {
                vc = (vc as! UINavigationController).visibleViewController
            }
        }
    }
    return vc
}

//获取当前的nav
func currentNavigationController() -> UINavigationController? {
    return currentViewController()?.navigationController
}


///  修改字符串为两种不同的颜色和字体大小
///
/// - Parameters:
///   - first: 前一段字符串
///   - next: 后一段字符串
///   - firstCorlor: 第一段的要设置的字体的颜色
///   - nextCorlor: 下一段要设置的字体的颜色
///   - firstFont: 第一段要设置的字体大小
///   - nextFont: 下一段要设置的字体大小
/// - Returns: 修改后 AttributedString
func setStringAtt(_ first: String, next: String, firstCorlor: UIColor, nextCorlor: UIColor, firstFont: UIFont, nextFont: UIFont) -> NSMutableAttributedString {
    let mutableAtt = NSMutableAttributedString.init(string: first)
    mutableAtt.addAttributes([NSAttributedString.Key.font: firstFont,
                              NSAttributedString.Key.foregroundColor: firstCorlor], range: NSRange.init(location: 0, length: first.count))
    let nextMutableAtt = NSMutableAttributedString.init(string: next)
    nextMutableAtt.addAttributes([NSAttributedString.Key.font: nextFont,
                                  NSAttributedString.Key.foregroundColor: nextCorlor], range: NSRange.init(location: 0, length: next.count))
    mutableAtt.append(nextMutableAtt)
    return mutableAtt
}






/// 修改小说章节内容多余的空格和换行
///
/// - Parameter text: 要修改的章节内容
/// - Returns: 返回修改后的章节内容
func fictionTextHandle(_ text: String) -> String {
    if text.isEmpty {
        return text
    }
    // 替换单换行
    var content = text.replacingOccurrences(of: "\r", with: "")
    content = "　　" + content
    // 替换换行 以及 多个换行 为 换行加空格

    content = content.patternReplacing(pattern: "\\s*\\n+\\s*", template: "\n　　")
    return content
}

/// 获取启动图
///
/// - Returns: 启动图的Image实例
func launchImage() -> UIImage {
    var lauchImage: UIImage?
    var viewOrientation: String?
    let viewSize = UIScreen.main.bounds.size
    let orientation = UIApplication.shared.statusBarOrientation
    
    if orientation == .landscapeLeft || orientation == .landscapeRight {
        viewOrientation = "Landscape"
        
    } else {
        viewOrientation = "Portrait"
    }
    
    let imagesInfoArray = Bundle.main.infoDictionary?["UILaunchImages"]
    for dict: Dictionary <String, String> in imagesInfoArray as! Array {
        let imageSize = NSCoder.cgSize(for: dict["UILaunchImageSize"] ?? "")
        if imageSize.equalTo(viewSize) && viewOrientation == dict["UILaunchImageOrientation"] {
            lauchImage = UIImage(named: dict["UILaunchImageName"] ?? "")
        }
    }
    return lauchImage ?? UIImage.init()
}

/// 图片转颜色
///
/// - Parameter image: 图片
/// - Returns: 图片转换的颜色
func transformColor(_ image: UIImage) -> UIColor {
    let size = UIScreen.main.bounds.size
    UIGraphicsBeginImageContextWithOptions(size, false, UIScreen.main.scale)
    let rect = CGRect.init(origin: CGPoint.zero, size: size)
    let currenContext = UIGraphicsGetCurrentContext()
    image.draw(in: rect)
    currenContext?.drawPath(using: CGPathDrawingMode.fillStroke)
    let newImage = UIGraphicsGetImageFromCurrentImageContext()
    UIGraphicsEndImageContext()
    return UIColor(patternImage: newImage ?? UIImage.init())
}


/// 获取栈的名称
///
/// - Parameter navigationController: 导航
/// - Returns: 路径
func getReadPath(_ navigationController: UINavigationController) -> String {
    var vcs = navigationController.viewControllers
    var pathString = ""
    
    for (index, vc) in vcs.enumerated() {
        let vcName = NSStringFromClass(type(of: vc))
        
        if vcName == "MReading.MRBookDetailViewController" && index == vcs.count - 1 {
            if (index - 1) >= 0  {
                pathString = NSStringFromClass(type(of: vcs[index-1])) + "+" + vcName
            }
            break
        }
        
        if vcName == "MReading.DZMReadController" && index == vcs.count - 1 {
            if (index - 2) >= 0  {
                pathString = NSStringFromClass(type(of: vcs[index-2])) + "+" + NSStringFromClass(type(of: vcs[index-1])) + "+" + vcName
            }
            break
        }
        
    }
    return pathString
}


