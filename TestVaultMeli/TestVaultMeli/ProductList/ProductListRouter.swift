//
//  ProductListRouter.swift
//  TestVaultMeli
//
//  Created by Juan Manuel Moreno on 28/07/23.
//

import Foundation

class ProductListRouter {
    func routeToProduct(from: ProductListViewController, to: ProductViewController) {
        from.navigationController?.pushViewController(to, animated: true)
    }
}
