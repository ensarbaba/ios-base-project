//
//  UILabelExtension.swift
//  MockApp
//
//  Created by M. Ensar Baba on 27.03.2019.
//  Copyright © 2019 MobileNOC. All rights reserved.
//
import UIKit

extension UILabel {
    
    static var informationLargeLabel: UILabel {
        let label = UILabel()
        label.numberOfLines = 0
        label.minimumScaleFactor = 0.5
        label.textAlignment = .center
        label.font = .robotoRegular19
        label.textColor = .black
        return label
    }
    static var informationSmallLabel: UILabel {
        let label = UILabel()
        label.numberOfLines = 0
                label.minimumScaleFactor = 0.5
        label.textAlignment = .center
        label.font = .robotoRegular14
        label.textColor = .black
        label.minimumScaleFactor = 0.5
        return label
    }
    
}
