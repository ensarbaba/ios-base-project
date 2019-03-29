//
//  FilterContainerView.swift
//  MockApp
//
//  Created by M. Ensar Baba on 27.03.2019.
//  Copyright © 2019 MobileNOC. All rights reserved.
//

import UIKit

class FilterContainerView: UIView {
    
    private lazy var filterView = FilterView()
    
    private lazy var filterLabel: UILabel = {
       let label = UILabel.informationSmallLabel
        label.text = "Filter by"
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
        self.backgroundColor = .white        
        self.snp.makeConstraints({ (make) in
            make.height.equalTo(50)
            make.width.equalTo(400)
        })
        self.addSubview(filterLabel)
        self.addSubview(filterView)
        self.setBorder(border: Border.left, weight: 1.0, color: .mockLightGray)
        filterLabel.snp.makeConstraints { (make) in
            make.top.bottom.equalToSuperview()
            make.left.equalToSuperview().offset(20)
        }
        filterView.snp.makeConstraints { (make) in
            make.leading.equalTo(filterLabel.snp.trailing)
            make.top.bottom.equalToSuperview()
        }
    }
}
