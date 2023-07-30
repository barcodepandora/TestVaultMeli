//
//  Site.swift
//  TestVaultMeli
//
//  Created by Juan Manuel Moreno on 29/07/23.
//

import Foundation

enum Site {
    struct Request {
        var site_id: String
        var results: [Product.Request]
    }
    
    struct Response {
        var site_id: String
        var results: [Product.Response]
    }
    
    struct ViewModel {
        var site_id: String
        var results: [Product.ViewModel]
    }
}
