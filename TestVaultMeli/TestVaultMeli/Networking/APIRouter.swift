//
//  APIRouter.swift
//  TestVaultMeli
//
//  Created by Juan Manuel Moreno on 29/07/23.
//

import Foundation
import Alamofire

enum APIRouter: URLRequestConvertible {
    
    case productListDomain
    case productListSite(q: String)
    
    // MARK: HTTPMethod
    private var method: HTTPMethod {
        switch self {
        case .productListDomain, .productListSite:
            return .get
        }
    }
    
    // MARK: Path
    private var path: String {
        switch self {
        case .productListDomain:
            return "/sites/MLA/domain_discovery/search"
        case .productListSite:
            return "/sites/MLA/search"
        }
    }
    
    // MARK: Parameters
    private var parameters: Parameters {
        switch self {
        case .productListDomain:
            return [APIConstant.APIParameterKey.q:"celular iphone", APIConstant.APIParameterKey.limit:"1"]
        case .productListSite(let q):
            return [APIConstant.APIParameterKey.q:q]
        }
    }
    
    // MARK: URLRequestConvertible
    func asURLRequest() throws -> URLRequest {
        let url = try APIConstant.Server.baseUrl.asURL()
        var urlRequest = URLRequest(url: url.appendingPathComponent(path))
        urlRequest.httpMethod = method.rawValue
        return try URLEncoding.default.encode(urlRequest, with: parameters)
    }
}
