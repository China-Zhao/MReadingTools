//
//  UIImageView+LoadURL.swift
//  MReading
//
//  Created by seven on 2018/5/17.
//  Copyright © 2018年 innovate. All rights reserved.
//

import UIKit
//import YYWebImage
import SDWebImage

extension UIImageView {
    /// 一般性的加载图片
    public func loadImage(_ url: String?, placeholder: String? = nil, defaultResult: String? = nil){
        let placehold: UIImage? = placeholder != nil ?  UIImage.init(named: placeholder!) : nil
        sd_setImage(with: URL.init(string: url ?? ""), placeholderImage: placehold) {[weak self] (image, error, type, url) in
            var result = image
            if result == nil && defaultResult != nil {
                result = UIImage.init(named: "米读")
            }
            self?.image = result
        }
    }
    
    /// 为图片切圆角和边框
    public func loadImageRadius(_ url: String?,
                         placeholder: String? = nil,
                         defaultResult: String? = nil,
                         radius: CGFloat = 2,
                         boraderWidth: CGFloat = 0.5,
                         borderColor: UIColor = UIColor.init(hex: "E1E1E1"),
                         backgroundColor: UIColor = UIColor.white) {
        
        let placehold: UIImage? = placeholder != nil ?  UIImage.init(named: placeholder!) : UIImage.init(named: "米读")
        sd_setImage(with: URL.init(string: url ?? ""), placeholderImage: placehold) { [weak self] (image, error, type, url) in
            var resultImage = image
            if image == nil && defaultResult != nil {
                resultImage = UIImage.init(named: defaultResult!)
            }
            self?.cornerRadiusWithImage(resultImage, radius: radius, boraderWidth: boraderWidth)
        }
    }
    
    private func cornerRadiusWithImage(_ image: UIImage?, radius: CGFloat, boraderWidth: CGFloat = 0.5, borderColor: UIColor = UIColor.init(hex: "E1E1E1"), backgroundColor: UIColor = UIColor.white) {
        let size = self.bounds.size
        let scale = UIScreen.main.scale
        let cornerRadii = CGSize.init(width: radius, height: radius)
        let newRect = bounds
        let backgroundRect = CGRect.init(origin: CGPoint.zero, size: CGSize.init(width: bounds.width + boraderWidth * 2, height: bounds.height + boraderWidth * 2))
        MReadingQueue.default.parallelQueue.async { [weak self] in
            UIGraphicsBeginImageContextWithOptions(size, true, scale)
            let cornerPath = UIBezierPath.init(roundedRect: newRect, byRoundingCorners: UIRectCorner.allCorners, cornerRadii: cornerRadii)
            let backgroundPath = UIBezierPath.init(rect: backgroundRect)
            backgroundColor.setFill()
            backgroundPath.fill()
            cornerPath.addClip()
            image?.draw(in: newRect)
            let cgImage = UIGraphicsGetImageFromCurrentImageContext()?.cgImage
            UIGraphicsEndImageContext()
            let maskLayer = CAShapeLayer.init()
            maskLayer.lineWidth = boraderWidth
            maskLayer.strokeColor = borderColor.cgColor
            maskLayer.fillColor = UIColor.clear.cgColor
            maskLayer.path = cornerPath.cgPath
            DispatchQueue.main.async { [weak self] in
                self?.layer.contents = cgImage
                self?.layer.addSublayer(maskLayer)
            }
        }
    }
}
