//
//  DateHandle.swift
//  MReading
//
//  Created by seven on 2018/6/15.
//  Copyright © 2018年 innovate. All rights reserved.
//

import Foundation

public struct DateHandle {
    /// 将时间转换为 "yyyy-MM-dd HH:mm:ss"
    ///
    /// - Parameter date: Date
    /// - Returns: 转换的结果
    public static func dateFormatTransform(_ date: Date) -> String {
        let dateFormatter = DateFormatter.init()
        dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        return dateFormatter.string(from: date)
    }
    
    /// 将时间转换为 "yyyy-MM-dd"
    ///
    /// - Parameter date: Date
    /// - Returns: 转换的结果
    public static func dateFormatDayTransform(_ date: Date) -> String {
        let dateFormatter = DateFormatter.init()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        return dateFormatter.string(from: date)
    }
    
}
