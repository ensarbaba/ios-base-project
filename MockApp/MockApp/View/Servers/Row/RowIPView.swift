//
//  RowIPView.swift
//  MockApp
//
//  Created by M. Ensar Baba on 28.03.2019.
//  Copyright © 2019 MobileNOC. All rights reserved.
//

import UIKit

class RowIPView: UIView {
    
    public var ipAddressLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.font = R.font.robotoLight(size: 30)
        label.numberOfLines = 1
        label.adjustsFontSizeToFitWidth = true
        label.minimumScaleFactor = 0.5
        return label
    }()
    
    public var ipSubnetLabel: UILabel = {
        let label = UILabel()
        label.textColor = .mockBlue
        label.numberOfLines = 1
        label.adjustsFontSizeToFitWidth = true
                label.minimumScaleFactor = 0.5
        label.font = R.font.robotoLight(size: 15)
        return label
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
        self.addSubview(ipAddressLabel)
        self.addSubview(ipSubnetLabel)
        ipAddressLabel.textAlignment = .center
                ipSubnetLabel.textAlignment = .center
        ipSubnetLabel.textColor = .mockBlue
        ipAddressLabel.snp.makeConstraints { (make) in
            make.left.right.equalToSuperview()
//            make.bottom.equalTo(ipSubnetLabel.snp.top).offset(-2)
//            make.top.equalToSuperview().offset(2)
            make.height.equalTo(40)
            make.centerY.equalToSuperview().offset(-15)
        }
        ipSubnetLabel.snp.makeConstraints { (make) in
            make.left.right.equalToSuperview()
//            make.bottom.equalToSuperview().offset(-2)
//            make.top.equalTo(ipAddressLabel.snp.bottom).offset(2)
            make.height.equalTo(20)
            make.centerY.equalToSuperview().offset(15)
        }
    }
}
