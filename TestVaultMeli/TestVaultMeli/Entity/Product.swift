//
//  Product.swift
//  TestVaultMeli
//
//  Created by Juan Manuel Moreno on 29/07/23.
//

import Foundation

enum Product {
    struct Request {
        var id: String
        var title: String
        var thumbnail: String
    }
    
    struct Response {
        var id: String
        var title: String
        var thumbnail: String
    }
    
    struct ViewModel {
        var id: String
        var title: String
        var thumbnail: String
    }
}
