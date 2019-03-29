//
//  RowActionsView.swift
//  MockApp
//
//  Created by M. Ensar Baba on 28.03.2019.
//  Copyright © 2019 MobileNOC. All rights reserved.
//

import UIKit
enum ActionColor: Int {
    case checked = 0,
    phone,
    clock,
    mute
    
    var color: UIColor {
        switch self {
        case .checked:
            return .mockPurple
        case .phone:
            return UIColor.purple.withAlphaComponent(0.5)
        case .clock:
            return .mockBlue
        case .mute:
            return .mockRed
        }
    }
}
protocol RowActionsViewDelegate: class {
    func didSelectAction(index: Int)
}

public class RowActionsView: UIStackView {
    
    weak var delegate: RowActionsViewDelegate?
    
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
            make.width.equalTo(25)
            make.height.equalTo(25)
        }
        
        let statusView = UIView()
        statusView.backgroundColor = .mockGray
        statusView.layer.cornerRadius = 25.0
        statusView.clipsToBounds = true
        statusView.snp.makeConstraints { (make) in
            make.width.equalTo(50)
            make.height.equalTo(50)
        }
        statusView.addSubview(actionView)
        actionView.snp.makeConstraints { (make) in
            make.center.equalToSuperview()
        }
        self.addArrangedSubview(statusView)
        
        statusView.isUserInteractionEnabled = true
        let gesturedRecognizer = UITapGestureRecognizer(target: self, action: #selector(didSelectAction(sender:)))
        statusView.addGestureRecognizer(gesturedRecognizer)
        
        statusView.tag = self.subviews.count-1
    }
    
    @objc func didSelectAction(sender: UIGestureRecognizer) {
        delegate?.didSelectAction(index: (sender.view?.tag)!)
        for subview in self.subviews where subview.tag == sender.view?.tag {
            if subview.backgroundColor == .mockGray {
                if let value = ActionColor(rawValue: subview.tag) {
                    subview.backgroundColor = value.color
                }
            } else {
                subview.backgroundColor = .mockGray
            }
        }
    }
    
    private func initialize() {
       self.addAction(image: R.image.checked())
       self.addAction(image: R.image.phone())
       self.addAction(image: R.image.clock())
       self.addAction(image: R.image.mute())
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
    }
}
