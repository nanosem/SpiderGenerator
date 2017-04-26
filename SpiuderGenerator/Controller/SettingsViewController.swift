//
//  SettingsViewController.swift
//  SpiuderGenerator
//
//  Created by Sem Vastuin on 24.04.17.
//  Copyright © 2017 Brander. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {

    var warningAction: (() -> Void)?
    
    fileprivate var selectedColor = DataManager.instance.spiderColor != nil ? DataManager.instance.spiderColor! : UIColor.black
    
    // MARK: - Private view elements
    
    private lazy var navContainerView: UIView = {
        let view = UIView()
        
        view.backgroundColor = UIColor.clear
        
        return view
    }()
    
    private lazy var backButton: UIButton = {
        let buttonView = UIButton()
        
        buttonView.setImage(UIImage(named: "back.png"), for: .normal)
        buttonView.backgroundColor = UIColor.clear
        buttonView.addTarget(self, action: #selector(backAction), for: .touchUpInside)
        
        return buttonView
    }()
    
    fileprivate lazy var spiderIcon: UIImageView = {
        let spiderIcon = UIImageView()
        
        let color = DataManager.instance.spiderColor != nil ? DataManager.instance.spiderColor! : UIColor.black
        
        spiderIcon.image = UIImage(named: "spider.png")?.image(withColor: color)
        
        return spiderIcon
    }()
    
    fileprivate var spiderCollection: UICollectionView!
    
    // MARK: - Life cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        showWarning()
        
        setupViews()    }
    
    // MARK: - Private methods
    
    private func showWarning() {
        
        warningAction?()
        warningAction = nil
    }
    
    private func setupViews() {
        self.view.backgroundColor = UIColor.lightGray
        
        setupNavContainerView()
        setupBackButton()
        setupSpiderIcon()
        setupSpiderCollection()
        
        self.view.addSubview(navContainerView)
        self.navContainerView.addSubview(backButton)
        self.navContainerView.addSubview(spiderIcon)
        
        self.view.addSubview(spiderCollection)
        
    }
    
    private func setupNavContainerView() {
        let width = Int(self.view.frame.width)
        let height = 64
        
        let x = 0
        let y = 16
        
        self.navContainerView.frame = CGRect(x: x, y: y, width: width, height: height)
    }
    
    private func setupBackButton() {
        let width = 64
        let height = 64
        
        let x = 0
        let y = 0
        
        backButton.frame = CGRect(x: x, y: y, width: width, height: height)
    }
    
    private func setupSpiderIcon() {
        let width = 64
        let height = 64
        
        let x = 80
        let y = 0
        
        spiderIcon.frame = CGRect(x: x, y: y, width: width, height: height)
    }
    
    // MARK: - Selector methods

    @objc private func backAction() {
        
        DataManager.instance.spiderColor = selectedColor
        
        navigationController?.popViewController(animated: true)
    }
}

extension SettingsViewController: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    fileprivate func setupSpiderCollection() {
        let x = 0
        let y = 72
        
        let width = Int(self.view.frame.width)
        let height = Int(self.view.frame.height - 64)
        
        let frame = CGRect(x: x, y: y, width: width, height: height)
        
        let layout = UICollectionViewFlowLayout()
        
        let cellSide = frame.width / 2 - 12
        layout.itemSize = CGSize(width: cellSide , height: cellSide)
        
        spiderCollection = UICollectionView(frame: frame, collectionViewLayout: layout)
        spiderCollection.backgroundColor = UIColor.clear
        
        spiderCollection.delegate = self
        spiderCollection.dataSource = self
        
        spiderCollection.register(SpiderViewCell.nibName, forCellWithReuseIdentifier: SpiderViewCell.identifier)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 8, left: 4, bottom: 0, right: 4)
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return DataManager.instance.colors.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: SpiderViewCell.identifier, for: indexPath) as! SpiderViewCell
        
        let color = DataManager.instance.colors[indexPath.row]
        
        cell.backgroundColor = UIColor.lightGray
        cell.update(withColor: color)
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let color = DataManager.instance.colors[indexPath.row]
        
        selectedColor = color
        
        spiderIcon.image = UIImage(named: "spider.png")?.image(withColor: color)
    }
}
