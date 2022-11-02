//
//  Spacer.swift
//  Traffic light
//
//  Created by Martin Kurbel on 02/11/2022.
//

import UIKit

/// View spacer class for easy spacing
class Spacer: UIView {
    init(width: CGFloat) {
        super.init(frame: .zero)
        widthAnchor(equalTo: width)
    }

    init(height: CGFloat) {
        super.init(frame: .zero)
        heightAnchor(equalTo: height)
    }

    init(size: CGSize) {
        super.init(frame: .zero)
        self.size(equalTo: size)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

