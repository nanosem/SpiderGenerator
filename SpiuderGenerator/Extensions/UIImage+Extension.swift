//
//  UIImage+Extension.swift
//  SpiuderGenerator
//
//  Created by Sem Vastuin on 25.04.17.
//  Copyright © 2017 Brander. All rights reserved.
//

import UIKit

extension UIImage {
    func image(withColor color: UIColor) -> UIImage {
        UIGraphicsBeginImageContextWithOptions(self.size, false, self.scale)
        color.setFill()
        
        guard let context = UIGraphicsGetCurrentContext() else { return self }
        context.translateBy(x: 0, y: self.size.height)
        context.scaleBy(x: 1.0, y: -1.0);
        context.setBlendMode(CGBlendMode.normal)
        
        let rect = CGRect(x: 0, y: 0, width: self.size.width, height: self.size.height)
        
        guard let cgImage = self.cgImage else { return self}
        
        context.clip(to: rect, mask: cgImage)
        context.fill(rect)
        
        guard let newImage = UIGraphicsGetImageFromCurrentImageContext() else { return self }
        UIGraphicsEndImageContext()
        
        return newImage
    }
}
