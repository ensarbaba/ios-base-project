//
//  LocationView.swift
//  MockApp
//
//  Created by M. Ensar Baba on 28.03.2019.
//  Copyright © 2019 MobileNOC. All rights reserved.
//

import UIKit

class LocationView: UIView {
    
    private lazy var locationImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.image = R.image.location()
        return imageView
    }()
    
    public var textField: SimpleTextField = {
        let textfield = SimpleTextField()
        textfield.placeholder = "All Locations"
        return textfield
    }()
    
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
        self.clipsToBounds = true
        self.layer.borderWidth = 1
        self.layer.borderColor = UIColor.mockLightGray.cgColor
        self.layer.cornerRadius = 25
        self.snp.makeConstraints({ (make) in
            make.height.equalTo(50)
            make.width.equalTo(150)
        })
        self.addSubview(textField)
        self.addSubview(locationImageView)
        
        locationImageView.snp.makeConstraints { (make) in
            make.left.equalToSuperview().offset(10)
            make.centerY.equalToSuperview()
            make.width.height.equalTo(20)
        }
        textField.snp.makeConstraints { (make) in
            make.top.bottom.equalToSuperview()
            make.leading.equalTo(locationImageView.snp.trailing).offset(10)
            make.right.equalToSuperview().offset(-10)
        }
   
    }
}
