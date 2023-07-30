//
//  APIClient.swift
//  TestVaultMeli
//
//  Created by Juan Manuel Moreno on 26/07/23.
//

import Foundation
import Alamofire

class APIClient {
    static var isInternetAvailable: Bool {
        return NetworkReachabilityManager()!.isReachable
    }

    static let decoder: JSONDecoder = {
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        return JSONDecoder()
    }()

    static func requestProductListDomainAttribute(completion: @escaping ([DomainDecodable]?, Error?) -> Void) {
        if !self.isInternetAvailable {
            completion(nil, NSError(domain: "", code: 401, userInfo: [ NSLocalizedDescriptionKey: "Internet KO"]))
        } else {
            AF.request(APIRouter.productListDomain)
            .responseDecodable(of: [DomainDecodable].self, decoder: decoder) { response in
                debugPrint(response)
                switch response.result {
                    case .success(let value):
                        if value.isEmpty {
                            completion(nil, NSError(domain: "", code: -1234, userInfo: [ NSLocalizedDescriptionKey: "Data 0"]))
                        } else {
                            completion(value, nil)
                        }
                    case .failure(let error):
                        completion(nil, error)
                }
            }
        }
    }
    
    static func requestProductListMockDomainAttribute(completion: @escaping ([DomainDecodable]?, Error?) -> Void) {
        if !self.isInternetAvailable {
            completion(nil, NSError(domain: "", code: 401, userInfo: [ NSLocalizedDescriptionKey: "Internet KO"]))
        } else {
            AF.request("https://api.mercadolibre.com/sites/MLA/domain_discovery/search?limit=1&q=celular%20iphone")
            .responseDecodable(of: [DomainDecodable].self, decoder: decoder) { response in
                debugPrint(response)
                switch response.result {
                    case .success(let value):
                        if value.isEmpty {
                            completion(nil, NSError(domain: "", code: -1234, userInfo: [ NSLocalizedDescriptionKey: "Data 0"]))
                        } else {
                            completion(value, nil)
                        }
                    case .failure(let error):
                        completion(nil, error)
                }
            }
        }
    }

    static func requestProductListSiteProduct(envelope: ProductListEnvelope, completion: @escaping (SiteDecodable?, Error?) -> Void) {
        if !self.isInternetAvailable {
            completion(nil, NSError(domain: "", code: 401, userInfo: [ NSLocalizedDescriptionKey: "Internet KO"]))
        } else {
            AF.request(APIRouter.productListSite(q: envelope.findBy))
            .responseDecodable(of: SiteDecodable.self, decoder: decoder) { response in
                debugPrint(response)
                switch response.result {
                case .success(let value):
                    if value == nil {
                        completion(nil, NSError(domain: "", code: -1234, userInfo: [ NSLocalizedDescriptionKey: "Data 0"]))
                    } else {
                        completion(value, nil)
                    }
                break
                    case .failure(let error):
                        completion(nil, error)
                }
            }
        }
    }

    static func requestProductListMockSiteProduct(completion: @escaping (SiteDecodable?, Error?) -> Void) {
        if !self.isInternetAvailable {
            completion(nil, NSError(domain: "", code: 401, userInfo: [ NSLocalizedDescriptionKey: "Internet KO"]))
        } else {
            AF.request("https://api.mercadolibre.com/sites/MLA/search?q=iphone")
            .responseDecodable(of: SiteDecodable.self, decoder: decoder) { response in
                debugPrint(response)
                switch response.result {
                    case .success(let value):
                        if value == nil {
                            completion(nil, NSError(domain: "", code: -1234, userInfo: [ NSLocalizedDescriptionKey: "Data 0"]))
                        } else {
                            completion(value, nil)
                        }
                    break
                    case .failure(let error):
                        completion(nil, error)
                }
            }
        }
    }
}
