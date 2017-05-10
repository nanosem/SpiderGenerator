//
//  NibName.swift
//  SpiuderGenerator
//
//  Created by Sem Vastuin on 27.04.17.
//  Copyright © 2017 Brander. All rights reserved.
//

import UIKit

protocol NibName {
    static var nibName: UINib { get }
}

extension NibName where Self: UIView {
    static var nibName: UINib {
        return UINib(nibName: "\(self)", bundle: nil)
    }
}
