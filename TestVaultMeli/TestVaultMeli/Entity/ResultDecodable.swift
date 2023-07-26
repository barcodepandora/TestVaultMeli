//
//  ResultDecodable.swift
//  TestVaultMeli
//
//  Created by Juan Manuel Moreno on 26/07/23.
//

import Foundation
class ResultsDecodable: Decodable{
    var results: [DomainDecodable]?
    
    enum CodingKeys: String, CodingKey{
        case results = "results"
    }
    
    required init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        self.results = try? values.decode([DomainDecodable].self, forKey: .results)
    }
}
