//
//  APIRouter.swift
//  TestVaultMeli
//
//  Created by Juan Manuel Moreno on 29/07/23.
//

import Foundation
import Alamofire

enum APIRouter: URLRequestConvertible {
    
    case productList
    
    // MARK: HTTPMethod
    private var method: HTTPMethod {
        switch self {
        case .productList:
            return .get
        }
    }
    
    // MARK: Path
    private var path: String {
        switch self {
        case .productList:
            return "/sites/MLA/domain_discovery/search"
        }
    }
    
    // MARK: Parameters
    private var parameters: Parameters {
        switch self {
        case .productList:
            return [APIConstant.APIParameterKey.q:"celular%20iphone", APIConstant.APIParameterKey.limit:"1"]
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
