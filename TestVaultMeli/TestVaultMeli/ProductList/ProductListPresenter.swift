//
//  ProductListPresenter.swift
//  TestVaultMeli
//
//  Created by Juan Manuel Moreno on 26/07/23.
//

import Foundation

class ProductListPresenter {
    var vc: ProductListViewController?
    
    init(vc: ProductListViewController) {
        self.vc = vc
    }
    
    func presentProductList(modelList: [Domain.ViewModel]) {
        self.vc!.presentProductList(modelList: modelList)
    }
    
    func presentError(error: Error) {
//        self.vc!.presentError(error: error)
    }
}
