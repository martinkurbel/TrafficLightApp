//
//  Button.swift
//  Traffic light
//
//  Created by Martin Kurbel on 02/11/2022.
//

import UIKit

class Button: UIButton {
    var titleText: String? {
        didSet {
            setTitle(titleText, for: .normal)
        }
    }

    // MARK: Actions
    var onAction: (() -> Void)?

    override init(frame: CGRect) {
        super.init(frame: frame)

        setupView()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    fileprivate func setupView() {
        addTarget(self, action: #selector(onTap), for: .touchUpInside)
    }

    @objc fileprivate func onTap() {
        onAction?()
    }
}
