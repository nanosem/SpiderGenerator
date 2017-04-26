//
//  Spider.swift
//  SpiuderGenerator
//
//  Created by Sem Vastuin on 25.04.17.
//  Copyright © 2017 Brander. All rights reserved.
//

import UIKit

struct Spider {
    let color: UIColor
    var position: (x: Int, y: Int)
    
    init(color: UIColor, position: (x: Int, y: Int)) {
        self.color = color
        
        self.position.x = position.x
        self.position.y = position.y
    }
    
    mutating func move() {
        self.position.x = 100
        self.position.y = 100
    }
}
