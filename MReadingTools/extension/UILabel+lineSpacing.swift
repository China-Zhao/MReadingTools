//
//  UILabel+lineSpacing.swift
//  MReading
//
//  Created by seven on 2018/7/10.
//  Copyright © 2018年 innovate. All rights reserved.
//

import Foundation
import UIKit

extension UILabel {
    public func setText(_ text: String, lineSpacing: CGFloat) {
        let mutableAtt = NSMutableAttributedString.init(string: text)
        let paragraphStyle = NSMutableParagraphStyle.init()
        paragraphStyle.lineSpacing = lineSpacing
        paragraphStyle.lineBreakMode = self.lineBreakMode
        paragraphStyle.alignment = self.textAlignment
        let selfFont = self.font ?? UIFont.systemFont(ofSize: 12)
        mutableAtt.addAttributes([NSAttributedString.Key.paragraphStyle: paragraphStyle, NSAttributedString.Key.font: selfFont], range: NSRange.init(location: 0, length: text.count))
        self.attributedText = mutableAtt
    }
}
