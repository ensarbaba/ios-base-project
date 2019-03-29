//
//  UIColorExtension.swift
//  MockApp
//
//  Created by M. Ensar Baba on 27.03.2019.
//  Copyright © 2019 MobileNOC. All rights reserved.
//
import UIKit

extension UIColor {
    
    static let mockDark = UIColor(hexString: "#2A3544")
    static let mockPurple = UIColor(hexString: "#5F4BCE")
    static let mockBlue = UIColor(hexString: "#1EA5FB")
    static let mockRed = UIColor.init(hexString: "#FB666B")
    
    static let mockLightGray = UIColor.init(hexString: "#EAEAEA")
    static let mockGray = UIColor.init(hexString: "#C7C7C7")
    static let mockYellow = UIColor.init(hexString: "#FDC58C")
    static let mockGreen = UIColor.init(hexString: "#46E7F2")
    
    convenience init(hexString: String, alpha: CGFloat = 1.0) {
        let hexString: String = hexString.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines)
        let scanner = Scanner(string: hexString)
        if hexString.hasPrefix("#") {
            scanner.scanLocation = 1
        }
        var color: UInt32 = 0
        scanner.scanHexInt32(&color)
        let mask = 0x000000FF
        let r = Int(color >> 16) & mask
        let g = Int(color >> 8) & mask
        let b = Int(color) & mask
        let red   = CGFloat(r) / 255.0
        let green = CGFloat(g) / 255.0
        let blue  = CGFloat(b) / 255.0
        self.init(red: red, green: green, blue: blue, alpha: alpha)
    }
    func toHexString() -> String {
        var r: CGFloat = 0
        var g: CGFloat = 0
        var b: CGFloat = 0
        var a: CGFloat = 0
        getRed(&r, green: &g, blue: &b, alpha: &a)
        let rgb: Int = (Int)(r*255)<<16 | (Int)(g*255)<<8 | (Int)(b*255)<<0
        return String(format: "#%06x", rgb)
    }
    
}
