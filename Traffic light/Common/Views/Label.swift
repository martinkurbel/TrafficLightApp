//
//  Label.swift
//  Traffic light
//
//  Created by Martin Kurbel on 02/11/2022.
//

import UIKit

class Label: UILabel {
    convenience init(style: UIFont.Weight = .regular,
                     size: CGFloat = 15,
                     color: UIColor = .black,
                     align: NSTextAlignment = .left,
                     lines: Int = 1,
                     scale: CGFloat = 0.8,
                     text: String? = nil) {
        self.init()
        
        self.textColor = color
        self.textAlignment = align
        self.numberOfLines = lines
        self.lineBreakMode = lines == 1 ? .byTruncatingTail : .byWordWrapping
        self.font = UIFont.systemFont(ofSize: size, weight: style)
        self.minimumScaleFactor = scale
        self.adjustsFontSizeToFitWidth = true
        self.text = text
    }
}
