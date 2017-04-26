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
    
    var colors: [UIColor] = [UIColor.black, UIColor.blue, UIColor.red, UIColor.green]
    var spiderColor: UIColor?
}
