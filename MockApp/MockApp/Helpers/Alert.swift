//
//  Alert.swift
//  MockApp
//
//  Created by M. Ensar Baba on 29.03.2019.
//  Copyright © 2019 MobileNOC. All rights reserved.
//

import UIKit
import SVProgressHUD

struct Alert {
    
    static public func showBasicAlert(on vc: UIViewController, with title: String, message: String) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alertController.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        DispatchQueue.main.async { vc.present(alertController, animated: true, completion: nil) }
    }
    
    static public func showBasicActionAlert(on vc: UIViewController, with title: String, message: String, actionHandler: ((UIAlertAction) -> Void)?) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alertController.addAction(UIAlertAction(title: "OK", style: .default, handler: actionHandler))
        DispatchQueue.main.async { vc.present(alertController, animated: true, completion: nil) }
    }
    
    static public func showError(on vc: UIViewController, error: String = "Error", message: String = "Some things went wrong") {
        if SVProgressHUD.isVisible() {
            SVProgressHUD.dismissOnMain()
        }
        Alert.showBasicAlert(on: vc, with: error, message: message)
    }
    
}
