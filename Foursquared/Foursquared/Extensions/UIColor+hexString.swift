//
//  UIColor+hexString.swift
//  Foursquared
//
//  Created by gary.odonoghue  on 23/07/2022.
//

import UIKit

/// Extension used to provide some helper functionality on top of `UIColor`, specifically related to hex values, such as initialising a `UIColor`
/// from a hex string value, and converting from a `UIColor` to a hex string representation
extension UIColor {
    
    public convenience init?(hex: String) {
        let r, g, b: CGFloat
        
        if hex.hasPrefix("#") {
            let start = hex.index(hex.startIndex, offsetBy: 1)
            let hexColor = String(hex[start...])
            
            if hexColor.count == 6 {
                let scanner = Scanner(string: hexColor)
                var hexNumber: UInt64 = 0
                
                if scanner.scanHexInt64(&hexNumber) {
                    r = CGFloat((hexNumber & 0xff0000) >> 16) / 255
                    g = CGFloat((hexNumber & 0x00ff00) >> 8) / 255
                    b = CGFloat((hexNumber & 0x0000ff)) / 255
                    
                    self.init(red: r, green: g, blue: b, alpha: 1.0)
                    return
                }
            }
        }
        
        return nil
    }
}


