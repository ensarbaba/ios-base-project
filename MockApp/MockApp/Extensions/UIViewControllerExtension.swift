//
//  UIViewControllerExtension.swift
//  MockApp
//
//  Created by M. Ensar Baba on 27.03.2019.
//  Copyright © 2019 MobileNOC. All rights reserved.
//

import UIKit
import SVProgressHUD

extension SVProgressHUD {
    public static func dismissOnMain() {
        DispatchQueue.main.async { SVProgressHUD.dismiss() }
    }
}

extension UIViewController {
    func hideBackButtonTitle() {
        navigationItem.backBarButtonItem = UIBarButtonItem(title: " ", style: .plain, target: nil, action: nil)
    }
}
