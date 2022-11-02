//
//  LightsViewController.swift
//  Traffic light
//
//  Created by Martin Kurbel on 02/11/2022.
//

import UIKit

class LightsViewController: ScrollStackViewController {
    // MARK: Views
    private let redLight = CircleTrafficLightView(style: .red)
    private let orangeLight = CircleTrafficLightView(style: .orange)
    private let greenLight = CircleTrafficLightView(style: .green)
    private let lightStackView = VStack(spacing: 32, alignment: .center,
                                        padding: .init(top: 24, left: 24, bottom: 24, right: 24))
    
    private let infoLabel = Label(style: .bold, size: 18, align: .center, lines: 0)
    private let carInfoLabel = Label(align: .center)
    
    // MARK: Data
    private var carModel: String?
    
    private var isTrafficLightsOn = true
    
    convenience init(carModel: String) {
        self.init()
        
        self.carModel = carModel
    }
    
    // MARK: Setup
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupView()
        stackViewSpacing = 8
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        runTrafficLight()
    }
    
    private func setupView() {
        title = "Traffic light"
        
        view.backgroundColor = .white
    }
    
    override func stackSubviews() {
        super.stackSubviews()
        
        stackView.addArrangedSubview(HStack([UIView(), lightStackView, UIView()],
                                            alignment: .center, distribution: .equalCentering))
        lightStackView.backgroundColor = UIColor.systemGray5
        lightStackView.layer.borderWidth = 4
        lightStackView.layer.borderColor = UIColor.darkGray.cgColor
        lightStackView.layer.cornerRadius = 8
        
        lightStackView.addArrangedSubviews([redLight, orangeLight, greenLight])
        
        stackView.addArrangedSubview(Spacer(height: 32))
        infoLabel.text = "Car model"
        stackView.addArrangedSubview(infoLabel)
        carInfoLabel.text = carModel
        stackView.addArrangedSubview(carInfoLabel)
    }
    
    private func runTrafficLight() {
        guard isTrafficLightsOn else { return }
        
        greenLight.isOn = true
        DispatchQueue.main.asyncAfter(deadline: .now() + .seconds(4)) {
            self.greenLight.isOn = false
            self.orangeLight.isOn = true
            
            DispatchQueue.main.asyncAfter(deadline: .now() + .seconds(1)) {
                self.orangeLight.isOn = false
                self.redLight.isOn = true
                
                DispatchQueue.main.asyncAfter(deadline: .now() + .seconds(4)) {
                    self.redLight.isOn = false
                    self.runTrafficLight()
                }
            }
        }
    }
}
