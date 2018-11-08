//
//  UIImage+Radius.swift
//  MReading
//
//  Created by seven on 2018/6/20.
//  Copyright © 2018年 innovate. All rights reserved.
//

import Foundation
import UIKit

extension UIImage {
    
    
    /// 图片切圆角
    ///
    /// - Parameters:
    ///   - radius: 要切的半径
    ///   - size: 图片大小
    ///   - color: 边框颜色
    /// - Returns: 完成切角的图片
    public func imageAddCornerWithRadius(_ radius: CGFloat, size: CGSize, color: UIColor) -> UIImage? {
        UIGraphicsBeginImageContextWithOptions(size, true, UIScreen.main.scale)
        let rect = CGRect.init(origin: CGPoint.zero, size: size)
        let path = UIBezierPath.init(roundedRect: rect, cornerRadius: 20)
        let currenContext = UIGraphicsGetCurrentContext()
        currenContext?.addPath(path.cgPath)
        currenContext?.clip()
        draw(in: rect)
        currenContext?.drawPath(using: CGPathDrawingMode.fillStroke)
        color.setStroke()
        path.lineWidth = 0.5
        path.stroke()
        let newImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return newImage
    }
    
    // 根据颜色转为图片
    public class func getImage(_ color: UIColor) -> UIImage? {
        let rect = CGRect(x: 0, y: 0, width: 1, height: 1)
        UIGraphicsBeginImageContextWithOptions(rect.size, true, UIScreen.main.scale)
        let context = UIGraphicsGetCurrentContext()
        context?.setFillColor(color.cgColor)
        context?.fill(rect)
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return image
    }
}

//extension ASNetworkImageNode {
//    func borderLayer() {
//        let path = UIBezierPath.init(roundedRect: self.bounds, byRoundingCorners: [.topRight, .topLeft, .bottomRight, .bottomLeft] , cornerRadii: CGSize.init(width: 2, height: 2));
//        let layer = CAShapeLayer.init();
//        layer.path = path.cgPath;
//        layer.lineWidth = 0.5;
//        layer.lineCap = kCALineCapSquare;
//        layer.strokeColor = UIColor.init(hex: "E1E1E1").cgColor;
//        //  注意直接填充layer的颜色，不需要设置控件view的backgroundColor
//        layer.fillColor = UIColor.clear.cgColor;
//        self.layer.addSublayer(layer)
//    }
//}
