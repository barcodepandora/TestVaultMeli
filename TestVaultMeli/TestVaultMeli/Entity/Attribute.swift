//
//  Attribute.swift
//  TestVaultMeli
//
//  Created by Juan Manuel Moreno on 26/07/23.
//

import Foundation

enum Attribute {
    struct Request {
        var id: String
        var name: String
        var value_id: String
        var value_name: String
    }
    
    struct Response {
        var id: String
        var name: String
        var value_id: String
        var value_name: String
    }
    
    struct ViewModel {
        var id: String
        var name: String
        var value_id: String
        var value_name: String
    }
}
