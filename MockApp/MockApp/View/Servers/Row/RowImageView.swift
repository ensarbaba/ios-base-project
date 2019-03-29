//
//  RowImageView.swift
//  MockApp
//
//  Created by M. Ensar Baba on 28.03.2019.
//  Copyright © 2019 MobileNOC. All rights reserved.
//

import UIKit

class RowImageView: UIImageView {
    
    public var rowImage: UIImage? {
        didSet {
            self.image = rowImage
        }
    }
    
    public override init(frame: CGRect) {
        super.init(frame: .zero)
        commonInit()
    }
    
    public required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }
    
    private func commonInit() {
        self.contentMode = .scaleAspectFit
        self.snp.makeConstraints { (make) in
            make.width.height.equalTo(50)
        }
        self.layer.cornerRadius = 25

        self.layer.borderColor = UIColor.clear.cgColor
        self.clipsToBounds = true
    }
}
