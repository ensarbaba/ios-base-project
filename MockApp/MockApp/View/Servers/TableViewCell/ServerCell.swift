//
//  ServerCell.swift
//  MockApp
//
//  Created by M. Ensar Baba on 28.03.2019.
//  Copyright © 2019 MobileNOC. All rights reserved.
//

import UIKit
enum ServerStatus: Int {
    case white = 0,
    green,
    orange,
    yellow,
    red
    
    var color: UIColor {
        switch self {
        case .green:
            return .mockGreen
        case .orange:
            return UIColor.orange
        case .yellow:
            return .mockYellow
        case .red:
            return .mockRed
        case .white:
            return .white
        }
    }
}

class ServerCell: UITableViewCell {
    
    private lazy var rowImageView = RowImageView(frame: .zero)
    public lazy var rowTitleLabel  = UILabel.informationLargeLabel
    public lazy var rowDetailLabel = UILabel.informationSmallLabel
    public lazy var ipView = RowIPView()
    public lazy var rowActionsView = RowActionsView()
    public lazy var statusView = RowServerStatusView()
    public lazy var failureLabel: UILabel = {
        let label = UILabel.informationLargeLabel
        label.textColor = .white
        label.textAlignment = .center
        label.backgroundColor = .mockRed
        return label
    }()
    
    public var rowImage: UIImage? {
        didSet {
            rowImageView.image = rowImage
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        commonInit()
    }
    
    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }
    public func setupCell(title: String?, detail: String?, image: UIImage?, ipAddress: String?, ipSubnet: String?, status: Int?, failure: String?) {
        rowTitleLabel.text = title
        rowDetailLabel.text = detail?.uppercased()
        rowImage = image
        ipView.ipAddressLabel.text = ipAddress
        ipView.ipSubnetLabel.text = ipSubnet
        if let value = ServerStatus.init(rawValue: status ?? 0) {
            statusView.status.backgroundColor = value.color
        }
        failureLabel.text = failure
    }
    
    private func commonInit() {
        self.contentView.backgroundColor = .white
        selectionStyle = .none
        rowDetailLabel.textColor = .mockBlue
        contentView.addSubview(rowImageView)
        contentView.addSubview(rowTitleLabel)
        contentView.addSubview(rowDetailLabel)
        contentView.addSubview(ipView)
        contentView.addSubview(rowActionsView)
        contentView.addSubview(statusView)
        contentView.addSubview(failureLabel)
        
        rowImageView.snp.makeConstraints { (make) in
            make.height.equalTo(50)
            make.width.equalTo(50)
            make.left.equalToSuperview().offset(10)
            make.centerY.equalToSuperview()
        }
        rowTitleLabel.snp.makeConstraints { (make) in
            make.leading.equalTo(rowImageView.snp.trailing).offset(25)
            make.centerY.equalToSuperview()
            make.width.equalTo(100)
        }
        rowDetailLabel.snp.makeConstraints { (make) in
            make.leading.equalTo(rowTitleLabel.snp.trailing).offset(25)
            make.centerY.equalToSuperview()
            make.width.equalTo(100)
        }
        ipView.snp.makeConstraints { (make) in
            make.leading.equalTo(rowDetailLabel.snp.trailing).offset(50)
            make.centerY.equalToSuperview()
            make.width.equalTo(200)
        }
        rowActionsView.snp.makeConstraints { (make) in
            make.leading.equalTo(ipView.snp.trailing).offset(50)
            make.centerY.equalToSuperview()
        }
        statusView.snp.makeConstraints { (make) in
            make.trailing.top.bottom.equalToSuperview().offset
            make.width.equalTo(80)
        }
        failureLabel.snp.makeConstraints { (make) in
            make.trailing.equalTo(statusView.snp.leading).offset(-25)
            make.leading.equalTo(rowActionsView.snp.trailing).offset(25)
            make.height.equalTo(40)
            make.centerY.equalToSuperview()
        }
        failureLabel.layer.masksToBounds = true

        failureLabel.layer.cornerRadius = 20

    }
    
}
