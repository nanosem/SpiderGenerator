//
//  MainViewController.swift
//  SpiuderGenerator
//
//  Created by Sem Vastuin on 24.04.17.
//  Copyright © 2017 Brander. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {
    private var spiders = [String: SpiderView]() {
        didSet {
            for spiderView in spiders.values {
                spiderView.move(toPosition: Utils.randomPosition(forView: self.view))
            }
        }
    }
    
    
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
    
    // TODO: Need to refactor
    private func move(view: UIView, toPosition pos: (x: Int, y: Int)) {
        UIView.animate(withDuration: 2, delay: 0, options: [.curveLinear], animations: {
            view.frame = CGRect(x: pos.x, y: pos.y, width: 32, height: 32)
        }, completion: nil)
    }

    
    // MARK: - Selector methods
    
    @objc private func backAction() {
        
        spiders = [:]
        DataManager.instance.spiderColor = nil
        
        navigationController?.popViewController(animated: true)
    }
    
    @objc private func settignsAction() {
        let settingsViewController = SettingsViewController()
        navigationController?.pushViewController(settingsViewController, animated: true)
    }
    
    @objc private func bornAction() {
        let color = DataManager.instance.spiderColor != nil ? DataManager.instance.spiderColor! : UIColor.black
        
        let position = (x: Int(self.view.frame.minX - 96), y: Int(self.view.frame.minY - 96))
        let spider = Spider(color: color, position: position)
        
        let frame = CGRect(x: position.x, y: position.y, width: 128, height: 128)
        let spiderView = SpiderView(frame: frame, withColor: color)

        self.view.addSubview(spiderView)
        spiders[spider.id] = spiderView
    }
}
