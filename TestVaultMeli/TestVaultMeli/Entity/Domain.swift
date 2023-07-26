//
//  Domain.swift
//  TestVaultMeli
//
//  Created by Juan Manuel Moreno on 26/07/23.
//

import Foundation

enum Domain {
    struct Request {
        var domain_id: String
        var domain_name: String
        var category_id: String
        var category_name: String
    }
    
    struct Response {
        var domain_id: String
        var domain_name: String
        var category_id: String
        var category_name: String
    }
    
    struct ViewModel {
        var domain_id: String
        var domain_name: String
        var category_id: String
        var category_name: String
    }
}
