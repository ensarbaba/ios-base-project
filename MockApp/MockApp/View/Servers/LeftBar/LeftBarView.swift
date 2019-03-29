//
//  LeftBarView.swift
//  MockApp
//
//  Created by M. Ensar Baba on 27.03.2019.
//  Copyright © 2019 MobileNOC. All rights reserved.
//

import UIKit

class LeftBarView: UIView {
    
    private lazy var topImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.layer.cornerRadius = 5
        imageView.clipsToBounds = true
        return imageView
    }()
    
    private lazy var bottomProfileImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.layer.cornerRadius = imageView.bounds.width/2
        imageView.clipsToBounds = true
        return imageView
    }()
    public var topImage: UIImage? {
        didSet {
            topImageView.image = topImage
            topImageView.contentMode = .scaleAspectFit
        }
    }
    public var bottomProfileImage: UIImage? {
        didSet {
            bottomProfileImageView.image = bottomProfileImage
            bottomProfileImageView.contentMode = .scaleAspectFit
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
        self.backgroundColor = .mockDark
        self.snp.makeConstraints { (make) in
            make.width.equalTo(80)
        }
        self.addSubview(topImageView)
        self.addSubview(bottomProfileImageView)
        
        topImageView.snp.makeConstraints { (make) in
            make.top.equalToSuperview().offset(10)
            make.centerX.equalToSuperview()
        }
        bottomProfileImageView.snp.makeConstraints { (make) in
            make.bottom.equalToSuperview().offset(-20)
            make.centerX.equalToSuperview()
        }
    }
}
