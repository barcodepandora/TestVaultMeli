//
//  DomainDecodable.swift
//  TestVaultMeli
//
//  Created by Juan Manuel Moreno on 26/07/23.
//

import Foundation

class DomainDecodable: Decodable {
    var domain_id: String?
    var domain_name: String?
    var category_id: String?
    var category_name: String?
    var attributes: [AttributeDecodable]?
    
    enum CodingKeys: String, CodingKey{
        case domain_id = "domain_id"
        case domain_name = "domain_name"
        case category_id = "category_id"
        case category_name = "category_name"
        case attributes = "attributes"
    }
    
    required init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        domain_id = try values.decodeIfPresent(String.self, forKey: .domain_id)
        domain_name = try values.decodeIfPresent(String.self, forKey: .domain_name)
        category_id = try values.decodeIfPresent(String.self, forKey: .category_id)
        category_name = try values.decodeIfPresent(String.self, forKey: .category_name)
        self.attributes = try? values.decode([AttributeDecodable].self, forKey: .attributes)
    }
}
