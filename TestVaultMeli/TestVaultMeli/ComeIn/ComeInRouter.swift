//
//  ComeInRouter.swift
//  TestVaultMeli
//
//  Created by Juan Manuel Moreno on 26/07/23.
//

import Foundation

class ComeInRouter {
    func routeToProductList(from: ViewController, to: ProductListViewController) {
        from.navigationController?.pushViewController(to, animated: true)
    }

}
