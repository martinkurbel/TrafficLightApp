//
//  MenuViewController.swift
//  Traffic light
//
//  Created by Martin Kurbel on 02/11/2022.
//

import UIKit

class MenuViewController: ScrollStackViewController {
    // MARK: Views
    private let infoLabel = Label(style: .bold, size: 18)
    private let carInfoTextField = UITextField()
    private let actionButton = Button()
    
    // MARK: Setup
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupView()
        setupActions()
    }
    
    private func setupView() {
        title = "Traffic light App"
        
        view.backgroundColor = .white
        
        stackViewSpacing = 8
    }
    
    override func stackSubviews() {
        super.stackSubviews()
        
        infoLabel.text = "Car model"
        stackView.addArrangedSubview(infoLabel)
        
        carInfoTextField.placeholder = "For example: BMW 320d"
        carInfoTextField.borderStyle = .roundedRect
        stackView.addArrangedSubview(carInfoTextField)
        
        stackView.addArrangedSubview(Spacer(height: 24))
        
        actionButton.titleText = "Start Driving"
        actionButton.backgroundColor = .systemBlue
        actionButton.layer.cornerRadius = 8
        actionButton.heightAnchor(equalTo: 42)
        stackView.addArrangedSubview(actionButton)
    }
    
    private func setupActions() {
        actionButton.onAction = { [weak self] in
            self?.goToTraficLightsScreen()
        }
    }
    
    private func goToTraficLightsScreen() {
        guard let carModelText = carInfoTextField.text, !carModelText.isEmpty else {
            let alert = UIAlertController(title: "Alert",
                                          message: "Car model field is empty. \n Please provide car model to continue.",
                                          preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            present(alert, animated: true)
            return
        }
        let vc = LightsViewController(carModel: carModelText)
        navigationController?.pushViewController(vc, animated: true)
    }
}
