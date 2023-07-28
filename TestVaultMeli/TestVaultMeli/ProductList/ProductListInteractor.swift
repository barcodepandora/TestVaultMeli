//
//  ProductListInteractor.swift
//  TestVaultMeli
//
//  Created by Juan Manuel Moreno on 26/07/23.
//

import Foundation

class ProductListInteractor {
    var presenter: ProductListPresenter?
    
    init(presenter: ProductListPresenter) {
        self.presenter = presenter
    }

    func requestProductList() {
        GetProductListUseCase().fetchProductList( completion: { (response, error) in
            if let response = response {
                self.presenter!.presentProductList(modelList: self.fromResponseToViewModel(response: response))
            } else if let error = error {
                self.presenter!.presentError(error: error)
            }
        })
    }
    
    func fromResponseToViewModel(response: [Domain.Response]) -> [Domain.ViewModel] {
        var domainList: [Domain.ViewModel] = []
        var attributeList: [Attribute.ViewModel] = []
        for domain in response {
            attributeList = []
            for attribute in domain.attributes {
                attributeList.append(Attribute.ViewModel(id: attribute.id,
                                                            name: attribute.name,
                                                            value_id: attribute.value_id,
                                                            value_name: attribute.value_name))
            }
            domainList.append(Domain.ViewModel(domain_id: domain.domain_id,
                                              domain_name: domain.domain_name,
                                              category_id: domain.category_id,
                                              category_name: domain.category_name,
                                              attributes: attributeList))
        }
        return domainList
    }
}
