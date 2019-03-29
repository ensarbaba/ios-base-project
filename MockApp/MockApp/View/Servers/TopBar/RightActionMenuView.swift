//
//  RightActionMenuView.swift
//  MockApp
//
//  Created by M. Ensar Baba on 28.03.2019.
//  Copyright © 2019 MobileNOC. All rights reserved.
//

import UIKit
protocol RightActionMenuViewDelegate: class {
    func didSelectAction(index: Int)
}

public class RightActionMenuView: UIStackView {
    
    weak var delegate: RightActionMenuViewDelegate?
    
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
    
    public func addAction(image: UIImage?) {
        let actionView = UIImageView()
        actionView.backgroundColor = .clear
        actionView.image = image
        actionView.snp.makeConstraints { (make) in
            make.width.equalTo(40)
            make.height.equalTo(40)
        }
        
        self.addArrangedSubview(actionView)
        
        actionView.isUserInteractionEnabled = true
        let gesturedRecognizer = UITapGestureRecognizer(target: self, action: #selector(didSelectAction(sender:)))
        actionView.addGestureRecognizer(gesturedRecognizer)
        
        actionView.tag = self.subviews.count
    }

    @objc func didSelectAction(sender: UIGestureRecognizer) {
        delegate?.didSelectAction(index: (sender.view?.tag)!-1)
//        for subview in self.subviews {
//            if subview.tag == sender.view?.tag {
//                subview.backgroundColor = .mockBlue
//                let labels = subview.subviews.compactMap { $0 as? UILabel }
//                for label in labels {
//                    label.textColor = .white
//                }
//            } else {
//                subview.backgroundColor = .white
//                let labels = subview.subviews.compactMap { $0 as? UILabel }
//                for label in labels {
//                    label.textColor = .mockLightGray
//                }
//            }
//        }
        
    }
    private lazy var backgroundLayer: CAShapeLayer = {
        let layer = CAShapeLayer()
        self.layer.insertSublayer(layer, at: 0)
        return layer
    }()
    override public func layoutSubviews() {
        super.layoutSubviews()
        backgroundLayer.path = UIBezierPath(rect: self.bounds).cgPath
        backgroundLayer.fillColor = UIColor.mockLightGray.cgColor
    }
    
    private func initialize() {
        
        self.addAction(image: R.image.world())
        self.addAction(image: R.image.list())
        self.addAction(image: R.image.network())
        self.frame = .zero
        self.alignment = .center
        self.distribution = .fillEqually
        self.axis = .horizontal
        self.spacing = 20
        self.layoutMargins = UIEdgeInsets(top: 0, left: 20, bottom: 0, right: 20)
        self.isLayoutMarginsRelativeArrangement = true
        self.snp.makeConstraints { (make) in
            make.height.equalTo(80)
        }
        self.setNeedsLayout()
    }
}
