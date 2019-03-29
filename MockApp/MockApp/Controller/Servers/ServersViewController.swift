//
//  ServersViewController.swift
//  MockApp
//
//  Created by M. Ensar Baba on 27.03.2019.
//  Copyright © 2019 MobileNOC. All rights reserved.
//

import UIKit

struct Server {
    var name: String?
    var ipAddress: String?
    var ipSubnetMask: String?
    var status: Int?
    var failure: String
}

class ServersViewController: ViewController {

    private lazy var leftBarView = LeftBarView()
    private lazy var topBaseView = TopBaseView()
    private lazy var searchView  = SearchView()
    private lazy var filterContainerView = FilterContainerView()
    private lazy var locationView = LocationView()
    private lazy var rightActionMenuView = RightActionMenuView()
    private lazy var badgeView = BadgeView()
    
    private var serverArray = [Server]()

    private lazy var serverTableView: UITableView = {
        let tv = UITableView()
        tv.delegate = self
        tv.dataSource = self
        tv.rowHeight = UITableView.automaticDimension
        tv.estimatedRowHeight = 100
        tv.separatorStyle = .none
        tv.backgroundColor = .clear
        tv.isUserInteractionEnabled = true
        tv.register(cellType: ServerCell.self)
        return tv
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
      fetchServerStatus()
    }
 
    private func setupUI() {
        self.view.addSubview(leftBarView)
        self.view.addSubview(topBaseView)
        self.view.addSubview(serverTableView)
        
        leftBarView.topImage = R.image.leftTop()
        leftBarView.bottomProfileImage = R.image.profile()
        leftBarView.snp.makeConstraints { (make) in
            make.left.equalToSuperview()
            make.top.equalTo(self.view.safeArea.top)
            make.bottom.equalTo(self.view.safeArea.bottom)
        }
        topBaseView.snp.makeConstraints { (make) in
            make.right.equalToSuperview()
            make.top.equalTo(self.view.safeArea.top)
            make.leading.equalTo(leftBarView.snp.trailing)
        }
        topBaseView.addSubview(searchView)
        topBaseView.addSubview(filterContainerView)
        topBaseView.addSubview(locationView)
        topBaseView.addSubview(rightActionMenuView)
        topBaseView.addSubview(badgeView)
        searchView.snp.makeConstraints { (make) in
            make.centerY.equalToSuperview()
            make.left.equalToSuperview().offset(15)
        }
        filterContainerView.snp.makeConstraints { (make) in
            make.centerY.equalToSuperview()
            make.leading.equalTo(searchView.snp.trailing).offset(20)
            
        }
        locationView.snp.makeConstraints { (make) in
            make.centerY.equalToSuperview()
            make.leading.equalTo(filterContainerView.snp.trailing).offset(20)
        }
        rightActionMenuView.snp.makeConstraints { (make) in
            make.right.equalToSuperview()
            make.centerY.equalToSuperview()
        }
        badgeView.snp.makeConstraints { (make) in
            make.top.bottom.equalToSuperview()
            make.trailing.equalTo(rightActionMenuView.snp.leading).offset(1)
        }
        
        serverTableView.snp.makeConstraints { (make) in
            make.top.equalTo(topBaseView.snp.bottom)
            make.right.equalToSuperview().offset(-15)
            make.leading.equalTo(leftBarView.snp.trailing).offset(15)
            make.bottom.equalTo(self.view.safeArea.bottom)
        }
    }
    
    private func fetchServerStatus() {
        startLoading()
        let request = ServerRequest()
        APIClient.instance.execute(request: request, success: { (responseObject) in
            self.serverArray.removeAll()
            for content in responseObject.content! {
                let item = Server(name: content.name, ipAddress: content.ipAddress, ipSubnetMask: content.ipSubnetMask, status: content.status?.id, failure: "Module 2 Failure")
                self.serverArray.append(item)
            }
            DispatchQueue.main.async {
                self.serverTableView.reloadData()
                self.stopLoading()
            }
        }, failure: self.showFailure)
    }
}

extension ServersViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return serverArray.count
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let serverCell = tableView.dequeueReusableCell(withIdentifier: "\(ServerCell.self)", for: indexPath) as! ServerCell
        serverCell.setupCell(title: serverArray[safe: indexPath.section]?.name, detail: "BRSANBCM01", image: R.image.profile(), ipAddress: serverArray[safe: indexPath.section]?.ipAddress, ipSubnet: serverArray[safe: indexPath.section]?.ipSubnetMask, status: serverArray[safe: indexPath.section]?.status, failure: serverArray[safe: indexPath.section]?.failure)
        return serverCell
    }
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 15
    }

    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = UIView()
        headerView.backgroundColor = .clear
        return headerView
    }
    
}

extension ServersViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
}
