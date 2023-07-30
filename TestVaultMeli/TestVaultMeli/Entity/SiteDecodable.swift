//
//  SiteDecodable.swift
//  TestVaultMeli
//
//  Created by Juan Manuel Moreno on 29/07/23.
//

import Foundation

class SiteDecodable: Decodable {
    var site_id: String?
    var results: [ProductDecodable]?
    
    enum CodingKeys: String, CodingKey{
        case site_id = "site_id"
        case results = "results"
    }
    
    required init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        site_id = try values.decodeIfPresent(String.self, forKey: .site_id)
        self.results = try? values.decode([ProductDecodable].self, forKey: .results)
    }
}
