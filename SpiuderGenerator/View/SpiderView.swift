//
//  SpiderView.swift
//  SpiuderGenerator
//
//  Created by Sem Vastuin on 26.04.17.
//  Copyright © 2017 Brander. All rights reserved.
//

import UIKit

class SpiderView: UIView {

    // MARK: - Private fields
    private var color: UIColor
    
    // MARK: - UI Elements
    private var spiderImageView: UIImageView
    
    // MARK: - UIView methods
    init(frame: CGRect, withColor color: UIColor) {
        self.color = color
        
        spiderImageView = UIImageView(frame: CGRect(x: 0, y: 0, width: frame.width, height: frame.height))
        spiderImageView.contentMode = .scaleAspectFit
        
        let image = UIImage(named: "spider.png")?.image(withColor: color)
        spiderImageView.image = image
        
        super.init(frame: frame)
        
        addSubview(spiderImageView)
        shakeAnimation()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Private functions
    
     func shakeAnimation() {
        self.spiderImageView.transform = CGAffineTransform(rotationAngle: CGFloat(-Double.pi / 6))
        self.spiderImageView.layer.anchorPoint = CGPoint(x: 0.5, y: 0.5)
        
        UIView.animate(withDuration: 0.2, delay: 0, options: [.repeat, .autoreverse], animations: {
            self.spiderImageView.transform = CGAffineTransform(rotationAngle: CGFloat(Double.pi / 6))
        }, completion: nil)
    }
    
    func move(toPosition pos: (x: Int, y: Int)) {
        UIView.animate(withDuration: 2, delay: 0, options: [.curveLinear], animations: {
            self.frame = CGRect(origin: CGPoint(x: pos.x, y: pos.y), size: self.frame.size)
            
        }, completion: nil)
    }
    
}
