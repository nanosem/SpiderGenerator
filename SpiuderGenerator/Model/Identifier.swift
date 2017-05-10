//
//  Identifier.swift
//  SpiuderGenerator
//
//  Created by Sem Vastuin on 27.04.17.
//  Copyright © 2017 Brander. All rights reserved.
//

import UIKit

protocol Identifier {
    static var identifier: String { get }
}

extension Identifier where Self: UIView {
    static var identifier: String {
        return "\(self)"
    }
}
