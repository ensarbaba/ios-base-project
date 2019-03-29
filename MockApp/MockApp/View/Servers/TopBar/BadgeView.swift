//
//  BadgeView.swift
//  MockApp
//
//  Created by M. Ensar Baba on 28.03.2019.
//  Copyright © 2019 MobileNOC. All rights reserved.
//

import UIKit

class BadgeView: UIView {
    
    public var badgeLabel = UILabel.informationLargeLabel
    
    public override init(frame: CGRect) {
        super.init(frame: .zero)
        commonInit()
    }
    
    public required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }
    
    private func commonInit() {
        badgeLabel.text = "231"
        badgeLabel.textColor = .white
        badgeLabel.textAlignment = .center
        
        self.backgroundColor = .mockRed
        self.layer.cornerRadius = 5
        self.clipsToBounds = true
        self.snp.makeConstraints({ (make) in
            make.width.equalTo(70)
        })
        self.addSubview(badgeLabel)
        badgeLabel.snp.makeConstraints { (make) in
            make.top.bottom.left.equalToSuperview()
            make.right.equalToSuperview().offset(-1)
        }
    
    }
}
