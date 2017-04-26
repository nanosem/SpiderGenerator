//
//  InitialViewController.swift
//  SpiuderGenerator
//
//  Created by Sem Vastuin on 24.04.17.
//  Copyright © 2017 Brander. All rights reserved.
//

import UIKit

class InitialViewController: UIViewController {
    
    lazy var startButton: UIButton = {
        let buttonView = UIButton()
        
        buttonView.setTitle("Start", for: .normal)
        buttonView.backgroundColor = UIColor.blue
        
        buttonView.addTarget(self, action: #selector(self.startAction), for: .touchUpInside)
        
        return buttonView
    }()
    
    // MARK: - Life cycle  
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    
    // MARK: - Private methods
    
    private func setupView() {
        navigationController?.isNavigationBarHidden = true
        
        self.view.backgroundColor = UIColor.white
        
        setupStartButton()
        
        self.view.addSubview(startButton)
    }
    
    private func setupStartButton() {
        let width = self.view.bounds.width / 2
        let height = width
        
        let x = self.view.bounds.width / 4
        let y = (self.view.center.y) - (height / 2)
        
        startButton.frame = CGRect(x: x, y: y, width: width, height: height)
    }
    
    // MARK: - Selector methods
    
    @objc private func startAction() {
        let mainViewController = MainViewController()
        navigationController?.pushViewController(mainViewController, animated: true)
    }
}
