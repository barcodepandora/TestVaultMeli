//
//  BaseViewController.swift
//  TestVaultMeli
//
//  Created by Juan Manuel Moreno on 29/07/23.
//

import UIKit

class BaseViewController: UIViewController {
    var spinner = SpinnerViewController()
    
    func createSpinnerView() {
        addChild(self.spinner)
        self.spinner.view.frame = view.frame
        view.addSubview(self.spinner.view)
        self.spinner.didMove(toParent: self)
    }
    
    func removeSpinner() {
        self.spinner.willMove(toParent: nil)
        self.spinner.view.removeFromSuperview()
        self.spinner.removeFromParent()
    }
    
    func presentAlertKO(message: String) {
        let alert = UIAlertController(title: "Moment", message: message, preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
}
