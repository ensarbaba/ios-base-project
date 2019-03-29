//
//  LoadDataView.swift
//  MockApp
//
//  Created by M. Ensar Baba on 29.03.2019.
//  Copyright © 2019 MobileNOC. All rights reserved.
//

import SVProgressHUD

protocol LoadDataView: class {
    func startLoading()
    func stopLoading()
}

extension LoadDataView {
    
    func startLoading() {
        UIApplication.shared.beginIgnoringInteractionEvents()
        SVProgressHUD.show()        
    }
    
    func stopLoading() {
        UIApplication.shared.endIgnoringInteractionEvents()
        SVProgressHUD.dismissOnMain()
    }
}
