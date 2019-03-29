//
//  FilterView.swift
//  MockApp
//
//  Created by M. Ensar Baba on 27.03.2019.
//  Copyright © 2019 MobileNOC. All rights reserved.
//

import UIKit
protocol FilterSelectionViewDelegate: class {
    func didSelectFilter(index: Int)
}

public class FilterView: UIStackView {
    
    weak var delegate: FilterSelectionViewDelegate?
    
    public init() {
        super.init(frame: .zero)
        self.initialize()
    }
    
    public override init(frame: CGRect) {
        super.init(frame: frame)
        self.initialize()
        
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public func addFilter(status: String) {
        let statusLabel = UILabel()
        statusLabel.font = UIFont.robotoRegular19
        statusLabel.textColor = .mockLightGray
        statusLabel.textAlignment = .center
        statusLabel.text = status
        
        let statusView = UIView()
        statusView.backgroundColor = .white
        statusView.layer.cornerRadius = 20.0
        statusView.clipsToBounds = true
        statusView.layer.borderWidth = 1
        statusView.layer.borderColor = UIColor.mockLightGray.cgColor
        statusView.snp.makeConstraints { (make) in
            make.width.equalTo(90)
            make.height.equalTo(45)
        }
        statusView.addSubview(statusLabel)
        statusLabel.snp.makeConstraints { (make) in
            make.edges.equalToSuperview()
        }
        self.addArrangedSubview(statusView)
        
        statusView.isUserInteractionEnabled = true
        let gesturedRecognizer = UITapGestureRecognizer(target: self, action: #selector(didSelectFilter(sender:)))
        statusView.addGestureRecognizer(gesturedRecognizer)
        
        statusView.tag = self.subviews.count
    }
    public func removeSelection() {
        for subview in self.subviews {
            subview.backgroundColor = UIColor.init(hexString: "#dcdce6")
            let labels = subview.subviews.compactMap { $0 as? UILabel }
            for label in labels {
                label.textColor = UIColor.init(hexString: "#6C757D")
            }
        }
    }
    @objc func didSelectFilter(sender: UIGestureRecognizer) {
        delegate?.didSelectFilter(index: (sender.view?.tag)!-1)
        for subview in self.subviews {
            if subview.tag == sender.view?.tag {
                subview.backgroundColor = .mockBlue
                let labels = subview.subviews.compactMap { $0 as? UILabel }
                for label in labels {
                    label.textColor = .white
                }
            } else {
                subview.backgroundColor = .white
                let labels = subview.subviews.compactMap { $0 as? UILabel }
                for label in labels {
                    label.textColor = .mockLightGray
                }
            }
        }
    }
    
    func initialize() {
        
        self.addFilter(status: "All")
        self.addFilter(status: "Active")
        self.addFilter(status: "Down")
        
        self.frame = .zero
        self.alignment = .center
        self.distribution = .fillEqually
        self.axis = .horizontal
        self.spacing = 15
        self.layoutMargins = UIEdgeInsets(top: 0, left: 20, bottom: 0, right: 20)
        self.isLayoutMarginsRelativeArrangement = true
        self.snp.makeConstraints { (make) in
            make.height.equalTo(80)
        }
    }
}
