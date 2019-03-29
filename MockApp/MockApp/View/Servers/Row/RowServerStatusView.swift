//
//  RowServerStatusView.swift
//  MockApp
//
//  Created by M. Ensar Baba on 28.03.2019.
//  Copyright © 2019 MobileNOC. All rights reserved.
//

import UIKit

class RowServerStatusView: UIView {
    
    public lazy var status = UIView()
    
    public override init(frame: CGRect) {
        super.init(frame: .zero)
        commonInit()
    }
    
    public required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }
    
    public func commonInit() {
        self.setBorder(border: .left, weight: 1.0, color: .mockGray)
        self.addSubview(status)
        status.snp.makeConstraints({ (make) in
            make.height.width.equalTo(40)
            make.center.equalToSuperview()
        })
        status.layer.cornerRadius = 20
        status.clipsToBounds = true
        let view = UIView()
        view.backgroundColor = .white
        self.addSubview(view)
        view.snp.makeConstraints { (make) in
            make.width.height.equalTo(10)
            make.center.equalToSuperview()
        }
        view.layer.cornerRadius = 5
        view.clipsToBounds = true
        self.bringSubviewToFront(view)
    }
}
