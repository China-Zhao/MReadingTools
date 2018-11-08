//
//  String + extension.swift
//  MReading
//
//  Created by seven on 2018/5/21.
//  Copyright © 2018年 innovate. All rights reserved.
//

import Foundation
import UIKit

extension String {
    /// 转化万人气
    public func transitionPopularity() -> String {
        let nsStr = (self as NSString).doubleValue
        if nsStr > 10000.0 {
            let number = thousandTransition()
            return "\(number)万人气"
        }else if nsStr == 0.0{
            return " 积攒人气中"
        }else {
            return "\(self)人气"
        }
    }
    
    /// 转换万字数
    public func transitionNumberOfWords() -> String {
        let nsStr = (self as NSString).doubleValue
        if nsStr > 10000.0 {
            let number = Int(nsStr/10000.0)
            return "\(number)万字"
        }else if nsStr == 0.0{
            return " 正在码字中"
        }else {
            return "\(self)字"
        }
    }
    
    /// 数字除以一万
    public func thousandTransition() -> String {
        let nsStr = (self as NSString).doubleValue/10000.0
        return String.init(format: "%.1f", nsStr)
    }
    
    /// 获得字符串的宽度
    public func getStringWidth(_ width: CGFloat, font: CGFloat, attributes:  [NSAttributedString.Key : Any]? = nil) -> CGFloat {
        let newString = self as NSString
        let att = attributes == nil ? [NSAttributedString.Key.font: UIFont.systemFont(ofSize: font)] : attributes
        let rect = newString.boundingRect(with: CGSize.init(width: width, height: UIScreen.main.bounds.height), options: NSStringDrawingOptions.usesLineFragmentOrigin, attributes: att, context: nil)
        return rect.width
    }
    
    /// 获取字符串的高度
    public func getStringHeight(_ width: CGFloat, font: CGFloat, attributes:  [NSAttributedString.Key : Any]? = nil) -> CGFloat {
        let newString = NSMutableAttributedString.init(string: self)
        newString.addAttributes(attributes ?? [NSAttributedString.Key.font: UIFont.systemFont(ofSize: font)], range: NSRange.init(location: 0, length: count))
        let rect = newString.boundingRect(with: CGSize.init(width: width, height: UIScreen.main.bounds.height * 100),
                                          options: [NSStringDrawingOptions.usesLineFragmentOrigin, NSStringDrawingOptions.usesFontLeading],
                                          context: nil)
        return rect.height
    }
    
    /// 截取字符串到索引的位置
    public func miReadingSubString(to index: Int) -> String {
        if index > self.count {
            return self
        }else {
            return String(self[..<self.index(self.startIndex, offsetBy: index)])
        }
    }
    
    /// 正则替换字符
    public func patternReplacing(pattern:String, template:String) ->String {
        
        if isEmpty {return self}
        
        do {
            let regularExpression = try NSRegularExpression(pattern: pattern, options: NSRegularExpression.Options.caseInsensitive)
            
            return regularExpression.stringByReplacingMatches(in: self, options: NSRegularExpression.MatchingOptions.reportProgress, range: NSMakeRange(0, mrLength), withTemplate: template)
            
        } catch {return self}
    }
    
    /**
     String 的 length
     
     - returns: Int
     */
    public var mrLength:Int {
        get{return (self as NSString).length}
    }
    
    /// 截取字符串从索引到末尾
    public func miReadingSubString(from index: Int) -> String {
        if index > self.count {
            return self
        }else {
           return String(self[self.index(self.startIndex, offsetBy: index)...])
        }
    }
    
    /// 获取某个字符在字符串中位置
    ///
    /// - Parameter subString: 需要查找的字符串
    /// - Returns: 字符的范围 NSRange
    public func miReadingNSRange(of subString: String) -> NSRange? {
        let rang = range(of: subString)
        return rang != nil ? NSRange.init(rang!, in: self) : nil
    }
    
    /// string -> double
    ///
    /// - Returns: double
    public func doubleValue() -> Double? {
        return Double(self)
    }
    
    /// string -> float
    ///
    /// - Returns: float
    public func floatValue() -> Float? {
        return Float(self)
    }
    
    /// string -> Int
    ///
    /// - Returns: Int?
    public func intValue() -> Int? {
        return Int(self)
    }
    
    /// string -> Int32
    ///
    /// - Returns: Int32 (32位Int)
    public func int32Value() -> Int32? {
        return Int32(self)
    }
    
    /// string -> Int64 (long long)
    ///
    /// - Returns: Int64 (long long)
    public func int64Value() -> Int64? {
        return Int64(self)
    }
    
    /// string -> CGFloat
    ///
    /// - Returns: CGFloat
    public func cgfloatValue() -> CGFloat {
        let doubule = Double(self) ?? 0.0
        return CGFloat.init(doubule)
    }
    
}
