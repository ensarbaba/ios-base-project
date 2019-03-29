//
//  UINavigationItemExtension.swift
//  MockApp
//
//  Created by M. Ensar Baba on 27.03.2019.
//  Copyright © 2019 MobileNOC. All rights reserved.
//

import UIKit

public extension UINavigationItem {
    public func replaceTitle(with image: UIImage) {
        let logoImageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 27, height: 20))
        logoImageView.contentMode = .scaleAspectFit
        logoImageView.image = image
        titleView = logoImageView
    }
    
}
