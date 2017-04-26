//
//  Spider.swift
//  SpiuderGenerator
//
//  Created by Sem Vastuin on 25.04.17.
//  Copyright © 2017 Brander. All rights reserved.
//

import UIKit

struct Spider {
    private static var counter = 0
    
    let id: String
    let color: UIColor
    var position: (x: Int, y: Int)
    
    init(color: UIColor, position: (x: Int, y: Int)) {
        self.color = color
        
        self.position.x = position.x
        self.position.y = position.y
        
        self.id = "\(Spider.counter)"
        Spider.counter += 1
    }
}

extension Spider: Equatable{
    static func == (lhs: Spider, rhs: Spider) -> Bool {
        return lhs.id == rhs.id
    }
}
