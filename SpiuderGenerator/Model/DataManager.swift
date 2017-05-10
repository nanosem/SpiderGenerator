//
//  DataManager.swift
//  SpiuderGenerator
//
//  Created by Sem Vastuin on 25.04.17.
//  Copyright © 2017 Brander. All rights reserved.
//

import UIKit

class DataManager {
    
    // MARK: - Singleton
    
    static let instance = DataManager()
    private init() {}
    
    // MARK: - Variables
    
    var colors: [UIColor] = [UIColor.black,
                             UIColor.green,
                             UIColor.brown,
                             UIColor.cyan,
                             UIColor(red:0.24, green:0.44, blue:0.89, alpha:1.0),
                             UIColor(red:0.79, green:0.19, blue:0.33, alpha:1.0),
                             UIColor(red:0.16, green:0.39, blue:0.36, alpha:1.0),
                             UIColor(red:0.77, green:0.38, blue:0.97, alpha:1.0)]
    
    var spiderColor: UIColor?
}
