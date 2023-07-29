//
//  GetProductListUseCase.swift
//  TestVaultMeli
//
//  Created by Juan Manuel Moreno on 26/07/23.
//

import Foundation

class GetProductListUseCase {
    func fetchProductList(completion: @escaping ([Domain.Response]?, Error?) -> Void) {
        APIClient.requestProductListMock(completion: { (response, error) in
            if let response = response {
                completion(self.fromDecodableToResponse(response: response), nil)
            } else if let error = error {
                completion(nil, error)
            }
        })
    }
    
    func fromDecodableToResponse(response: [DomainDecodable]) -> [Domain.Response] {
        var domainList: [Domain.Response] = []
        var attributeList: [Attribute.Response] = []
        for domain in response {
            attributeList = []
            for attribute in domain.attributes! {
                attributeList.append(Attribute.Response(id: attribute.id!,
                                                            name: attribute.name!,
                                                            value_id: attribute.value_id!,
                                                            value_name: attribute.value_name!))
            }
            domainList.append(Domain.Response(domain_id: domain.domain_id!,
                                              domain_name: domain.domain_name!,
                                              category_id: domain.category_id!,
                                              category_name: domain.category_name!,
                                              attributes: attributeList))
        }
        return domainList
    }
}
