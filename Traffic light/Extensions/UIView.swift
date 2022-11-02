//
//  UIView.swift
//  Traffic light
//
//  Created by Martin Kurbel on 02/11/2022.
//

import UIKit

extension UIView {
    func removeAllSubviews() {
        for subview in self.subviews as [UIView] {
            subview.removeFromSuperview()
        }
    }
    
    var height: CGFloat {
        return frame.height
    }
    
    var width: CGFloat {
        return frame.width
    }
    
    var x: CGFloat {
        return frame.origin.x
    }
    
    var y: CGFloat {
        return frame.origin.y
    }
}
