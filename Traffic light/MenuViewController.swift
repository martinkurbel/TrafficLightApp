//
//  ViewController.swift
//  Traffic light
//
//  Created by Martin Kurbel on 02/11/2022.
//

import UIKit

class MainViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupView()
    }
    
    private func setupView() {
        title = "Traffic light App"
        navigationController?.navigationBar.prefersLargeTitles = true
        
        view.backgroundColor = .white
    }
}
