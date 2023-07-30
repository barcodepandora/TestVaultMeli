//
//  XploreRouter.swift
//  TestVaultMeli
//
//  Created by Juan Manuel Moreno on 28/07/23.
//

import Foundation

class XploreRouter {
    func routeToProductList(from: XploreViewController, to: ProductListViewController) throws {
        if to.envelope.findBy.isEmpty {
            throw MeliError.findByIsEmpty
        }
        from.navigationController?.pushViewController(to, animated: true)
    }
}
