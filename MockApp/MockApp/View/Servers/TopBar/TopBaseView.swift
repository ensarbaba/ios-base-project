//
//  TopBaseView.swift
//  MockApp
//
//  Created by M. Ensar Baba on 27.03.2019.
//  Copyright © 2019 MobileNOC. All rights reserved.
//

import UIKit

class TopBaseView: UIView {
    
    public override init(frame: CGRect) {
        super.init(frame: .zero)
        commonInit()
    }
    
    public required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }
    
    private func commonInit() {
        self.backgroundColor = .white
        self.layer.borderColor = UIColor.mockGray.cgColor
        self.layer.borderWidth = 1.0
        
        self.layer.shadowOffset = CGSize(width: 0, height: 3)
//        self.layer.shadowRadius = 1
        self.layer.shadowOpacity = 0.6
        self.layer.shadowRadius = 3.0
        self.layer.shadowColor = UIColor.gray.cgColor


        
        self.snp.makeConstraints({ (make) in
            make.height.equalTo(80)
        })
    }
}
