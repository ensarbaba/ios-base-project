//
//  SearchView.swift
//  MockApp
//
//  Created by M. Ensar Baba on 27.03.2019.
//  Copyright © 2019 MobileNOC. All rights reserved.
//

import UIKit

class SearchView: UIView {
    
    private lazy var searchImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.image = R.image.search()
        return imageView
    }()
    
    public var textField: SimpleTextField = {
        let textfield = SimpleTextField()
        textfield.placeholder = "Search"
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
        self.backgroundColor = .mockLightGray
        self.layer.cornerRadius = 25
        self.clipsToBounds = true
        self.snp.makeConstraints({ (make) in
            make.height.equalTo(50)
            make.width.equalTo(300)
        })
        self.addSubview(textField)
        self.addSubview(searchImageView)
        
        textField.snp.makeConstraints { (make) in
            make.top.bottom.equalToSuperview()
            make.left.equalToSuperview().offset(20)
                        make.right.equalToSuperview().offset(-20)
        }
        searchImageView.snp.makeConstraints { (make) in
            make.right.equalToSuperview().offset(-20)
            make.top.equalToSuperview().offset(5)
            make.bottom.equalToSuperview().offset(-5)
            make.width.height.equalTo(20)
        }
    }
}
