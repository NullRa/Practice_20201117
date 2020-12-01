//
//  UIViewController.swift
//  Practice_20201117
//
//  Created by Jay on 2020/12/1.
//

import UIKit

// MARK: - alertMessage
extension UIViewController {
    func alertMessage(title:String,message:String?){
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "Confirm", style: .default, handler: nil)
        alert.addAction(okAction)
        self.present(alert, animated: true, completion: nil)
    }
}
