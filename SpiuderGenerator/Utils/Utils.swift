//
//  Utils.swift
//  SpiuderGenerator
//
//  Created by Sem Vastuin on 26.04.17.
//  Copyright © 2017 Brander. All rights reserved.
//

import UIKit

struct Utils {
    static func randomPosition(forView view: UIView) -> (x: Int, y: Int) {
        let x = Int(arc4random_uniform(UInt32(view.frame.maxX)))
        let y = Int(arc4random_uniform(UInt32(view.frame.maxY)))
        
        return (x: x, y: y)
    }
}
