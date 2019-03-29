//
//  FailableView.swift
//  MockApp
//
//  Created by M. Ensar Baba on 29.03.2019.
//  Copyright © 2019 MobileNOC. All rights reserved.
//

import SVProgressHUD

protocol FailableView: class {
    func showFailure(error: APIError)
    func showError(error: Error)
}

extension FailableView where Self: UIViewController {
    func showFailure(error: APIError) {
        if SVProgressHUD.isVisible() {
            UIApplication.shared.endIgnoringInteractionEvents()
            SVProgressHUD.dismissOnMain()
        }
        
        switch error {
        case .network(let error):
            Alert.showBasicAlert(on: self, with: "", message: error.localizedDescription)
        case .serialization(let message):
            Alert.showBasicAlert(on: self, with: "", message: message)
        case .service(let errorModel):
            Alert.showBasicAlert(on: self, with: errorModel.errorCode ?? "", message: errorModel.message ?? "Error with no message")
        case .custom(let message):
            Alert.showBasicAlert(on: self, with: "", message: message)
        }
    }
    
    func showError(error: Error) {
        if SVProgressHUD.isVisible() { SVProgressHUD.dismissOnMain() }
//        Alert.showError(on: self, error: error as! BookmarkError)
        Alert.showError(on: self)
    }
}
