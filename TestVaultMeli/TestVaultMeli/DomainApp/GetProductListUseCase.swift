//
//  GetProductListUseCase.swift
//  TestVaultMeli
//
//  Created by Juan Manuel Moreno on 26/07/23.
//

import Foundation

class GetProductListUseCase {
    func fetchProductListDomainAttribute(completion: @escaping ([Domain.Response]?, Error?) -> Void) {
        APIClient.requestProductListMockDomainAttribute(completion: { (response, error) in
            if let response = response {
                completion(self.fromDecodableToResponseDomainAttribute(response: response), nil)
            } else if let error = error {
                completion(nil, error)
            }
        })
    }
    
    func fetchProductListSiteProduct(envelope: ProductListEnvelope, completion: @escaping (Site.Response?, Error?) -> Void) {
        APIClient.requestProductListSiteProduct(envelope: envelope, completion: { (response, error) in
            if let response = response {
                completion(self.fromDecodableToResponseSiteProduct(response: response), nil)
            } else if let error = error {
                completion(nil, error)
            }
        })
    }
    
    func fromDecodableToResponseDomainAttribute(response: [DomainDecodable]) -> [Domain.Response] {
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
    
    func fromDecodableToResponseSiteProduct(response: SiteDecodable) -> Site.Response {
        var productList: [Product.Response] = []
        for product in response.results! {
            productList.append(Product.Response(id: product.id!,
                                                title: product.title!,
                                                thumbnail: product.thumbnail!))
        }
        var site = Site.Response(site_id: response.site_id!, results: productList)
        return site
    }
}
