//
//  UIImageView+LoadURL.swift
//  MReading
//
//  Created by seven on 2018/5/17.
//  Copyright © 2018年 innovate. All rights reserved.
//

import UIKit

extension UIImageView {
    public func loadImage(_ url: String, placeholder: String){
        self.sd_setImage(with: URL.init(string: url), placeholderImage: UIImage.init(named: placeholder))
    }
}
