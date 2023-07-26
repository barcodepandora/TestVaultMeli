//
//  ViewController.swift
//  TestVaultMeli
//
//  Created by Juan Manuel Moreno on 26/07/23.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func comein(_ sender: Any) {
        let router = ComeInRouter().routeToProductList(from: self, to: ProductListViewController())
    }
    
}

