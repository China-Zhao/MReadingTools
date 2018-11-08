//
//  MReadingQueue.swift
//  MReading
//
//  Created by seven on 2018/8/17.
//  Copyright © 2018年 innovate. All rights reserved.
//  除了网络请求和数据库线程以外的 全局线程队列

import UIKit

public class MReadingQueue: NSObject {
    public static let `default` = MReadingQueue.init()
    private override init() {
        super.init()
    }
    /// 串行队列
    public lazy var serialQueue: DispatchQueue = {
        return DispatchQueue.init(label: "com.innovate.MReading.queue.serial")
    }()
    /// 并行队列
    public lazy var parallelQueue: DispatchQueue = {
        return DispatchQueue.init(label: "com.innovate.MReading.queue.parallel", attributes: .concurrent)
    }()
}
