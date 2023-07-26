//
//  ProductListViewController.swift
//  TestVaultMeli
//
//  Created by Juan Manuel Moreno on 26/07/23.
//

import UIKit

class ProductListViewController: UIViewController {
    var interactor: ProductListInteractor!
    var presenter: ProductListPresenter!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        print("inside ")
        self.presenter = ProductListPresenter(vc: self)
        self.interactor = ProductListInteractor(presenter: self.presenter)
    }

    override func viewWillAppear(_ animated: Bool) {
        self.requireProductList()
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

    // MARK: Business
    private func requireProductList() {
        self.interactor.requestProductList()
    }
}
