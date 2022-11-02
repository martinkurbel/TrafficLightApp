//
//  ScrollStackViewController.swift
//  Traffic light
//
//  Created by Martin Kurbel on 02/11/2022.
//

import UIKit

class ScrollStackViewController: UIViewController {
    let scrollView = UIScrollView()
    let stackView = VStack(spacing: 16, alignment: .fill, distribution: .fill,
                           padding: .init(top: 32, left: 16,
                                          bottom: 32, right: 16))
    
    var stackViewSpacing: CGFloat = 16 {
        didSet {
            stackView.spacing = stackViewSpacing
        }
    }

    var stackViewPadding: UIEdgeInsets? {
        didSet {
            stackView.setPadding(stackViewPadding ?? .zero)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupViews()
        stackSubviews()
    }

    func setupViews() {
        scrollView.showsVerticalScrollIndicator = false
        scrollView.showsHorizontalScrollIndicator = false
        
        view.addSubview(scrollView)
        scrollView.pinSidesToSuperview()
        
        scrollView.addSubview(stackView)
        stackView.pinSidesToSuperview()
        stackView.widthAnchor(equalTo: scrollView.widthAnchor)
    }

    func stackSubviews() {
        stackView.removeAllSubviews()
    }
}
