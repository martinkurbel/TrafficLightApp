//
//  UIView+Constraints.swift
//  Traffic light
//
//  Created by Martin Kurbel on 02/11/2022.
//

import UIKit

extension UIView {
    func addConstraintsToFillSuperView(hPadding: CGFloat, vPadding: CGFloat) {
        addConstraintsToFillSuperView(padding: UIEdgeInsets(top: vPadding, left: hPadding, bottom: vPadding, right: hPadding))
    }

    func addConstraintsToFillSuperView(sidesPadding padding: CGFloat) {
        addConstraintsToFillSuperView(padding: UIEdgeInsets(top: padding, left: padding, bottom: padding, right: padding))
    }

    func addConstraintsToFillSuperView(padding: UIEdgeInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0),
                                       zeroWidthExpected: Bool = false,
                                       zeroHeightExpected: Bool = false) {
        guard let superview = superview else { return }
        self.translatesAutoresizingMaskIntoConstraints = false
        self.leftAnchor.constraint(equalTo: superview.leftAnchor, constant: padding.left).isActive = true
        self.topAnchor.constraint(equalTo: superview.topAnchor, constant: padding.top).isActive = true

        // often views are initialized with zero width/height,
        // which causes inner constraints breakage. Setting right/bottom constraint as non .required solves the problem
        let rightConstraint = self.rightAnchor.constraint(equalTo: superview.rightAnchor, constant: -padding.right)
        if zeroWidthExpected {
            rightConstraint.priority = UILayoutPriority(rawValue: 999)
        }
        rightConstraint.isActive = true
        let bottomConstraint = self.bottomAnchor.constraint(equalTo: superview.bottomAnchor, constant: -padding.bottom)
        if zeroHeightExpected {
            bottomConstraint.priority = UILayoutPriority(rawValue: 999)
        }
        bottomConstraint.isActive = true
    }

    func addConstraintsToFillSuperView(height: CGFloat, padding: UIEdgeInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)) {
        guard let superview = superview else { return }
        self.translatesAutoresizingMaskIntoConstraints = false
        self.leftAnchor.constraint(equalTo: superview.leftAnchor, constant: padding.left).isActive = true
        self.rightAnchor.constraint(equalTo: superview.rightAnchor, constant: -padding.right).isActive = true
        self.topAnchor.constraint(equalTo: superview.topAnchor, constant: padding.top).isActive = true
        self.heightAnchor.constraint(equalToConstant: height).isActive = true
    }

    @discardableResult
    func heightAnchor(equalTo constant: CGFloat, priority: UILayoutPriority = .required) -> NSLayoutConstraint {
        self.translatesAutoresizingMaskIntoConstraints = false
        let constraint = self.heightAnchor.constraint(equalToConstant: constant)
        constraint.priority = priority
        constraint.isActive = true
        return constraint
    }

    func heightAnchor(equalTo anchor: NSLayoutAnchor<NSLayoutDimension>) {
        self.translatesAutoresizingMaskIntoConstraints = false
        self.heightAnchor.constraint(equalTo: anchor).isActive = true
    }

    func heightAnchor(lessThanOrEqualTo constant: CGFloat) {
        self.translatesAutoresizingMaskIntoConstraints = false
        self.heightAnchor.constraint(lessThanOrEqualToConstant: constant).isActive = true
    }
    
    func heightAnchor(greaterThanOrEqualTo constant: CGFloat) {
        self.translatesAutoresizingMaskIntoConstraints = false
        self.heightAnchor.constraint(greaterThanOrEqualToConstant: constant).isActive = true
    }

    @discardableResult
    func widthAnchor(equalTo constant: CGFloat, priority: UILayoutPriority = .required) -> NSLayoutConstraint {
        self.translatesAutoresizingMaskIntoConstraints = false
        let constraint = self.widthAnchor.constraint(equalToConstant: constant)
        constraint.priority = priority
        constraint.isActive = true
        return constraint
    }

    func widthAnchor(equalTo anchor: NSLayoutDimension, constant: CGFloat = 0, priority: UILayoutPriority = .required) {
        self.translatesAutoresizingMaskIntoConstraints = false
        let constraint = self.widthAnchor.constraint(equalTo: anchor, multiplier: 1, constant: constant)
        constraint.priority = priority
        constraint.isActive = true
    }

    func widthAnchor(lessThanOrEqualTo anchor: NSLayoutDimension, constant: CGFloat = 0) {
        self.translatesAutoresizingMaskIntoConstraints = false
        self.widthAnchor.constraint(lessThanOrEqualTo: anchor, constant: constant).isActive = true
    }

    func widthAnchor(lessThanOrEqualTo constant: CGFloat) {
        self.translatesAutoresizingMaskIntoConstraints = false
        self.widthAnchor.constraint(lessThanOrEqualToConstant: constant).isActive = true
    }

    func size(equalTo constant: CGSize) {
        widthAnchor(equalTo: constant.width)
        heightAnchor(equalTo: constant.height)
    }

    func size(equalTo constant: CGFloat, priority: UILayoutPriority = .defaultHigh) {
        widthAnchor(equalTo: constant, priority: priority)
        heightAnchor(equalTo: constant, priority: priority)
    }

    /// Sets width to height aspect ratio.
    @discardableResult
    func aspectRatio(equalTo ratio: CGFloat) -> NSLayoutConstraint {
        let ratioConstraint = NSLayoutConstraint(item: self,
                                                 attribute: .width,
                                                 relatedBy: .equal,
                                                 toItem: self,
                                                 attribute: .height,
                                                 multiplier: ratio,
                                                 constant: 0)
        ratioConstraint.isActive = true
        addConstraint(ratioConstraint)
        return ratioConstraint
    }

    func centerY(equalTo anchor: NSLayoutYAxisAnchor, padding: CGFloat = 0) {
        self.translatesAutoresizingMaskIntoConstraints = false
        self.centerYAnchor.constraint(equalTo: anchor, constant: padding).isActive = true
    }

    func centerX(equalTo anchor: NSLayoutXAxisAnchor) {
        self.translatesAutoresizingMaskIntoConstraints = false
        self.centerXAnchor.constraint(equalTo: anchor).isActive = true
    }

    func centerVerticaly(with view: UIView) {
        self.translatesAutoresizingMaskIntoConstraints = false
        centerY(equalTo: view.centerYAnchor)
    }

    func centerHorizontaly(with view: UIView) {
        self.translatesAutoresizingMaskIntoConstraints = false
        centerX(equalTo: view.centerXAnchor)
    }

    func center(with view: UIView) {
        self.centerVerticaly(with: view)
        self.centerHorizontaly(with: view)
    }

    @discardableResult
    func topAnchor(equalTo anchor: NSLayoutYAxisAnchor,
                   padding constant: CGFloat = 0,
                   priority: UILayoutPriority = .required) -> NSLayoutConstraint {
        self.translatesAutoresizingMaskIntoConstraints = false
        let constraint = self.topAnchor.constraint(equalTo: anchor, constant: constant)
        constraint.priority = priority
        constraint.isActive = true
        return constraint
    }

    func topAnchor(greaterThanOrEqualTo anchor: NSLayoutYAxisAnchor, padding constant: CGFloat = 0) {
        self.translatesAutoresizingMaskIntoConstraints = false
        self.topAnchor.constraint(greaterThanOrEqualTo: anchor, constant: constant).isActive = true
    }

    @discardableResult
    func bottomAnchor(equalTo anchor: NSLayoutYAxisAnchor, padding constant: CGFloat = 0) -> NSLayoutConstraint {
        self.translatesAutoresizingMaskIntoConstraints = false
        let constraint = self.bottomAnchor.constraint(equalTo: anchor, constant: -constant)
        constraint.isActive = true
        return constraint
    }

    @discardableResult
    func bottomAnchor(equalTo anchor: NSLayoutYAxisAnchor, padding constant: CGFloat = 0,
                      priority: UILayoutPriority = .required) -> NSLayoutConstraint {
        self.translatesAutoresizingMaskIntoConstraints = false
        let constraint = self.bottomAnchor.constraint(equalTo: anchor, constant: constant)
        constraint.priority = priority
        constraint.isActive = true
        return constraint
    }

    func bottomAnchor(greaterThanOrEqualTo anchor: NSLayoutYAxisAnchor, padding constant: CGFloat = 0) {
        self.translatesAutoresizingMaskIntoConstraints = false
        self.bottomAnchor.constraint(greaterThanOrEqualTo: anchor, constant: constant).isActive = true
    }

    func bottomAnchor(lessThanOrEqualTo anchor: NSLayoutYAxisAnchor, padding constant: CGFloat = 0) {
        self.translatesAutoresizingMaskIntoConstraints = false
        self.bottomAnchor.constraint(lessThanOrEqualTo: anchor, constant: constant).isActive = true
    }

    func bottomAnchor(equalTo view: UIView, attribute: NSLayoutConstraint.Attribute, multiplier: CGFloat) {
        self.translatesAutoresizingMaskIntoConstraints = false
        let constraint = NSLayoutConstraint(item: self,
                                            attribute: .bottom,
                                            relatedBy: .equal,
                                            toItem: view,
                                            attribute: attribute,
                                            multiplier: multiplier,
                                            constant: 0)
        constraint.isActive = true
    }

    @discardableResult
    func leftAnchor(equalTo anchor: NSLayoutXAxisAnchor,
                    padding constant: CGFloat = 0,
                    priority: UILayoutPriority = .required) -> NSLayoutConstraint {
        self.translatesAutoresizingMaskIntoConstraints = false
        let constraint = self.leftAnchor.constraint(equalTo: anchor, constant: constant)
        constraint.priority = priority
        constraint.isActive = true
        return constraint
    }

    func leftAnchor(lessThanOrEqualTo anchor: NSLayoutXAxisAnchor) {
        self.translatesAutoresizingMaskIntoConstraints = false
        self.leftAnchor.constraint(lessThanOrEqualTo: anchor).isActive = true
    }

    func leftAnchor(greaterThanOrEqualTo anchor: NSLayoutXAxisAnchor) {
        self.translatesAutoresizingMaskIntoConstraints = false
        self.leftAnchor.constraint(greaterThanOrEqualTo: anchor).isActive = true
    }

    @discardableResult
    func rightAnchor(equalTo anchor: NSLayoutXAxisAnchor,
                     padding constant: CGFloat = 0,
                     priority: UILayoutPriority = .required) -> NSLayoutConstraint {
        self.translatesAutoresizingMaskIntoConstraints = false
        let constraint = self.rightAnchor.constraint(equalTo: anchor, constant: -constant)
        constraint.priority = priority
        constraint.isActive = true
        return constraint
    }

    func rightAnchor(lessThanOrEqualTo anchor: NSLayoutXAxisAnchor) {
        self.translatesAutoresizingMaskIntoConstraints = false
        self.rightAnchor.constraint(lessThanOrEqualTo: anchor).isActive = true
    }

    func rightAnchor(greaterThanOrEqualTo anchor: NSLayoutXAxisAnchor) {
        self.translatesAutoresizingMaskIntoConstraints = false
        self.rightAnchor.constraint(greaterThanOrEqualTo: anchor).isActive = true
    }

    func rightAnchor(equalTo view: UIView, attribute: NSLayoutConstraint.Attribute, multiplier: CGFloat) {
        self.translatesAutoresizingMaskIntoConstraints = false
        let constraint = NSLayoutConstraint(item: self,
                           attribute: .right,
                           relatedBy: .equal,
                           toItem: view,
                           attribute: attribute,
                           multiplier: multiplier,
                           constant: 0)
        constraint.isActive = true
    }

    func pinHorizontalSides(toSidesOfView view: UIView, padding: CGFloat = 0) {
        self.leftAnchor(equalTo: view.leftAnchor, padding: padding)
        self.rightAnchor(equalTo: view.rightAnchor, padding: padding)
    }

    func pinVerticalSides(toSidesOfView view: UIView, padding: CGFloat = 0) {
        self.topAnchor(equalTo: view.topAnchor, padding: padding)
        self.bottomAnchor(equalTo: view.bottomAnchor, padding: padding)
    }
    
    func pinVerticalSidesToSafeArea(toSidesOfView view: UIView, padding: CGFloat = 0) {
        self.topAnchor(equalTo: view.safeAreaLayoutGuide.topAnchor, padding: padding)
        self.bottomAnchor(equalTo: view.safeAreaLayoutGuide.bottomAnchor, padding: padding)
    }

    func pinHorizontalSidesToSuperview(padding: CGFloat = 0) {
        guard let superview = superview else { return }
        self.leftAnchor(equalTo: superview.leftAnchor, padding: padding)
        self.rightAnchor(equalTo: superview.rightAnchor, padding: padding)
    }

    func pinVerticalSidesToSuperview(padding: CGFloat = 0) {
        guard let superview = superview else { return }
        self.topAnchor(equalTo: superview.topAnchor, padding: padding)
        self.bottomAnchor(equalTo: superview.bottomAnchor, padding: padding)
    }

    func pinSides(toSidesofView view: UIView, padding: CGFloat = 0) {
        self.pinVerticalSides(toSidesOfView: view, padding: padding)
        self.pinHorizontalSides(toSidesOfView: view, padding: padding)
    }

    func pinSidesToSuperview(padding: CGFloat = 0) {
        guard let superview = superview else { return }
        self.pinVerticalSides(toSidesOfView: superview, padding: padding)
        self.pinHorizontalSides(toSidesOfView: superview, padding: padding)
    }
    
    func pinSidesToSafeAreaOfSuperview(padding: CGFloat = 0) {
        guard let superview = superview else { return }
        self.pinVerticalSidesToSafeArea(toSidesOfView: superview, padding: padding)
        self.pinHorizontalSides(toSidesOfView: superview, padding: padding)
    }

    func removeAllConstraints() {
        var currentSuperview = self.superview

        while let superview = currentSuperview {
            for constraint in superview.constraints {
                if let first = constraint.firstItem as? UIView, first == self {
                    superview.removeConstraint(constraint)
                }
                if let second = constraint.secondItem as? UIView, second == self {
                    superview.removeConstraint(constraint)
                }
            }
            currentSuperview = superview.superview
        }

        self.removeConstraints(self.constraints)
        self.translatesAutoresizingMaskIntoConstraints = true
    }
}

