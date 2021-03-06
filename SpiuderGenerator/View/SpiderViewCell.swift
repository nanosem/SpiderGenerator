//
//  SpiderViewCell.swift
//  SpiuderGenerator
//
//  Created by Sem Vastuin on 25.04.17.
//  Copyright © 2017 Brander. All rights reserved.
//

import UIKit

class SpiderViewCell: UICollectionViewCell, NibName, Identifier {
    
    // MARK: - Private properties
    
    @IBOutlet private weak var spiderImageView: UIImageView!
    
    // MARK: - Methods
    
    func update(withColor color: UIColor) {
        guard let standartImage = UIImage(named: "spider.png") else { return }
        spiderImageView.image = standartImage.image(withColor: color)
    }
    
}
