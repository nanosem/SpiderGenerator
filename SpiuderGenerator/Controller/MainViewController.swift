//
//  MainViewController.swift
//  SpiuderGenerator
//
//  Created by Sem Vastuin on 24.04.17.
//  Copyright © 2017 Brander. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {
    
    // MARK: - Private view elements
    
    private lazy var webImageView: UIImageView = {
        let imageView = UIImageView()
        
        imageView.image = UIImage(named: "web.png")?.image(withColor: UIColor.white)
        imageView.contentMode = .scaleAspectFill
        
        imageView.tintColor = UIColor.white
        
        return imageView
    }()
    
    private lazy var spiderBornButton: UIButton = {
        let button = UIButton()
        
        button.addTarget(self, action: #selector(bornAction), for: .touchUpInside)
        
        return button
    }()
    
    private lazy var navContainerView: UIView = {
        let view = UIView()
        
        view.backgroundColor = UIColor.clear
        
        return UIView()
    }()
    
    private lazy var backButton: UIButton = {
        let buttonView = UIButton()
        
        buttonView.setImage(UIImage(named: "back.png"), for: .normal)
        buttonView.backgroundColor = UIColor.clear
        buttonView.addTarget(self, action: #selector(backAction), for: .touchUpInside)
        
        return buttonView
    }()
    
    private lazy var settingsButton: UIButton = {
        let buttonView = UIButton()
        
        buttonView.setImage(UIImage(named: "settings.png"), for: .normal)
        buttonView.backgroundColor = UIColor.clear
        buttonView.addTarget(self, action: #selector(settignsAction), for: .touchUpInside)
        
        return buttonView
    }()
    
    private var spiders = [Spider]()
    
     // MARK: - Life cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupViews()
    }
    
    // MARK: - Private functions
    
    private func setupViews() {
        self.view.backgroundColor = UIColor.lightGray
        navigationController?.isNavigationBarHidden = true
        
        setupWebImageView()
        
        setupNavContainerView()
        setupBackButton()
        setupSettingsButton()
        setupSpiderBornButton()
        
        self.view.addSubview(spiderBornButton)
        self.view.addSubview(webImageView)
        self.view.addSubview(navContainerView)
        
        navContainerView.addSubview(backButton)
        navContainerView.addSubview(settingsButton)
    }
    
    private func setupSpiderBornButton() {
        spiderBornButton.frame = self.view.frame
    }
    
    private func setupWebImageView() {
        webImageView.frame = self.view.frame
    }

    private func setupNavContainerView() {
        let width = Int(self.view.bounds.width)
        let height = 64
        
        let x = 0
        let y = 16
        
        navContainerView.frame = CGRect(x: x, y: y, width: width, height: height)
    }
    
    private func setupBackButton() {
        let width = 64
        let height = 64
        
        let x = 0
        let y = 0
        
        backButton.frame = CGRect(x: x, y: y, width: width, height: height)
    }
    
    private func setupSettingsButton() {
        let width = 64
        let height = 64
        
        let x = Int(self.view.frame.maxX - 64)
        let y = 0
        
        settingsButton.frame = CGRect(x: x, y: y, width: width, height: height)
    }
    
    // MARK: - Selector methods
    
    @objc private func backAction() {
        spiders = []
        DataManager.instance.spiderColor = nil
        
        navigationController?.popViewController(animated: true)
    }
    
    @objc private func settignsAction() {
        let settingsViewController = SettingsViewController()
        navigationController?.pushViewController(settingsViewController, animated: true)
    }
    
    @objc private func bornAction() {
        guard let color = DataManager.instance.spiderColor else {
            
            let settingsViewController = SettingsViewController()
            
            settingsViewController.warningAction = { [weak self] in
                guard let strongSelf = self else { return }
                
                let alert = UIAlertController(title: "", message: "Select spider", preferredStyle: UIAlertControllerStyle.alert)
                
                alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
                
                strongSelf.present(alert, animated: true, completion: nil)
            }
            
            navigationController?.pushViewController(settingsViewController, animated: true)
            return
        }
        
        let position = Utils.randomPosition(forView: self.view)
        let spider = Spider(color: color, position: position)
        
        self.spiders.append(spider)
        
//        NotificationCenter.default.post(name: .spiderBorned, object: nil)
        
    }
}
