//
//  UIViewController+Ext.swift
//  Corona19Demo
//
//  Created by Sunmi on 2020/06/09.
//  Copyright © 2020 sun. All rights reserved.
//

import UIKit

extension UIViewController {
    func presentAlertOnMainThread(title: String, message: String, buttonTitle: String) {
        DispatchQueue.main.async {
            let alertVC = CR19AlertVC(title: title, message: message, buttonTitle: buttonTitle)
                       alertVC.modalPresentationStyle  = .overFullScreen
                       alertVC.modalTransitionStyle    = .crossDissolve
                       alertVC.view.layoutIfNeeded() //avoid Snapshotting error
                       self.present(alertVC, animated: true)
        }
    }
}

