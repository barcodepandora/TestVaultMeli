//
//  ProductDecodable.swift
//  TestVaultMeli
//
//  Created by Juan Manuel Moreno on 29/07/23.
//

import Foundation

class ProductDecodable: Decodable {
    var id: String?
    var title: String?
    var thumbnail: String?
    
    enum CodingKeys: String, CodingKey{
        case id = "id"
        case title = "title"
        case thumbnail = "thumbnail"
    }
    
    required init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        id = try values.decodeIfPresent(String.self, forKey: .id)
        title = try values.decodeIfPresent(String.self, forKey: .title)
        thumbnail = try values.decodeIfPresent(String.self, forKey: .title)
    }
}
