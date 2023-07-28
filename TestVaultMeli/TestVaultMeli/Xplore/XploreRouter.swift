//
//  XploreRouter.swift
//  TestVaultMeli
//
//  Created by Juan Manuel Moreno on 28/07/23.
//

import Foundation

class XploreRouter {
    func routeToProductList(from: XploreViewController, to: ProductListViewController) {
        from.navigationController?.pushViewController(to, animated: true)
    }
}
