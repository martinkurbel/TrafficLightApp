//
//  StackViews.swift
//  Traffic light
//
//  Created by Martin Kurbel on 02/11/2022.
//

import UIKit

class VStack: UIStackView {
    init(_ views: [UIView],
         spacing: CGFloat = 0,
         alignment: UIStackView.Alignment = .fill,
         distribution: UIStackView.Distribution = .fill,
         padding: UIEdgeInsets = .zero) {
        super.init(frame: .zero)
        views.forEach {
            addArrangedSubview($0)
        }
        axis = .vertical
        self.spacing = spacing
        self.alignment = alignment
        self.distribution = distribution
        if padding != .zero {
            setPadding(padding)
        }
    }

    convenience init(_ views: UIView...,
                     spacing: CGFloat = 0,
                     alignment: UIStackView.Alignment = .fill,
                     distribution: UIStackView.Distribution = .fill,
                     padding: UIEdgeInsets = .zero) {
        self.init(views, spacing: spacing, alignment: alignment, distribution: distribution, padding: padding)
    }

    convenience init(spacing: CGFloat = 0,
                     alignment: UIStackView.Alignment = .fill,
                     distribution: UIStackView.Distribution = .fill,
                     padding: UIEdgeInsets = .zero,
                     views: (() -> [UIView])) {
        self.init(views(), spacing: spacing, alignment: alignment, distribution: distribution, padding: padding)
    }

    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

class HStack: UIStackView {
    init(_ views: [UIView],
         spacing: CGFloat = 0,
         alignment: UIStackView.Alignment = .fill,
         distribution: UIStackView.Distribution = .fill,
         padding: UIEdgeInsets = .zero) {
        super.init(frame: .zero)
        views.forEach {
            addArrangedSubview($0)
        }
        axis = .horizontal
        self.spacing = spacing
        self.alignment = alignment
        self.distribution = distribution
        if padding != .zero {
            setPadding(padding)
        }
    }

    convenience init(_ views: UIView...,
                     spacing: CGFloat = 0,
                     alignment: UIStackView.Alignment = .fill,
                     distribution: UIStackView.Distribution = .fill,
                     padding: UIEdgeInsets = .zero) {
        self.init(views, spacing: spacing, alignment: alignment, distribution: distribution, padding: padding)
    }

    convenience init(spacing: CGFloat = 0,
                     alignment: UIStackView.Alignment = .fill,
                     distribution: UIStackView.Distribution = .fill,
                     padding: UIEdgeInsets = .zero,
                     views: (() -> [UIView])) {
        self.init(views(), spacing: spacing, alignment: alignment, distribution: distribution, padding: padding)
    }

    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension UIStackView {
    /// Sets sides padding
    func setPadding(_ padding: UIEdgeInsets) {
        isLayoutMarginsRelativeArrangement = true
        layoutMargins = padding
    }

    func addArrangedSubviews(_ views: UIView...) {
        addArrangedSubviews(views)
    }

    func addArrangedSubviews(_ views: [UIView]) {
        views.forEach {
            addArrangedSubview($0)
        }
    }

    /// Removes all arranged subviews
    func removeArrangedSubviews() {
        arrangedSubviews.forEach {
            $0.removeFromSuperview()
        }
    }
    
    // Adds empty view to stack view
    func addEmptyView() {
        addArrangedSubview(UIView())
    }
}

