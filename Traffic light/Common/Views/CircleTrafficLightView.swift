//
//  CircleTrafficLightView.swift
//  Traffic light
//
//  Created by Martin Kurbel on 02/11/2022.
//

import UIKit

class CircleTrafficLightView: UIView {
    var style: TrafficLightColor
    var isOn = false {
        didSet {
            setupSwitching()
        }
    }
    
    private let sizeOfCircle: CGFloat = 120
    
    init(style: TrafficLightColor) {
        self.style = style
        super.init(frame: .zero)
        
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupView() {
        layer.cornerRadius = sizeOfCircle/2
        size(equalTo: sizeOfCircle)
        
        backgroundColor = style.color
        alpha = 0.1
    }
    
    private func setupSwitching() {
        DispatchQueue.main.async {
            UIView.animate(withDuration: 0.2) {
                self.alpha = self.isOn ? 1 : 0.1
            }
        }
    }
}

enum TrafficLightColor {
    case red
    case orange
    case green
    
    var color: UIColor {
        switch self {
        case .red:
            return UIColor.red
        case .orange:
            return UIColor.orange
        case .green:
            return UIColor.green
        }
    }
}
