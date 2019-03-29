//
//  ViewController.swift
//  MockApp
//
//  Created by M. Ensar Baba on 27.03.2019.
//  Copyright © 2019 MobileNOC. All rights reserved.
//

import UIKit
import SVProgressHUD

public class ViewController: UIViewController {
    
    deinit {
        Log.di(String(describing: self))
    }
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .mockLightGray
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
    }
}
extension ViewController: LoadDataView {
    
    func startLoading() {
        UIApplication.shared.beginIgnoringInteractionEvents()
        SVProgressHUD.show()
    }
    
    func stopLoading() {
        UIApplication.shared.endIgnoringInteractionEvents()
        SVProgressHUD.dismissOnMain()
    }
}
extension ViewController: FailableView {
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
