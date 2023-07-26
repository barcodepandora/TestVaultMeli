//
//  AttributeDecodable.swift
//  TestVaultMeli
//
//  Created by Juan Manuel Moreno on 26/07/23.
//

import Foundation

class AttributeDecodable: Decodable {
    var id: String?
    var name: String?
    var value_id: String?
    var value_name: String?
    
    enum CodingKeys: String, CodingKey{
        case id = "id"
        case name = "name"
        case value_id = "value_id"
        case value_name = "value_name"
    }
    
    required init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        id = try values.decodeIfPresent(String.self, forKey: .id)
        name = try values.decodeIfPresent(String.self, forKey: .name)
        value_id = try values.decodeIfPresent(String.self, forKey: .value_id)
        value_name = try values.decodeIfPresent(String.self, forKey: .value_name)
    }
}
