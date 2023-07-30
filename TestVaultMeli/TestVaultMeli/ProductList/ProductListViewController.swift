//
//  ProductListViewController.swift
//  TestVaultMeli
//
//  Created by Juan Manuel Moreno on 26/07/23.
//

import UIKit

class ProductListViewController: BaseViewController {
    
    @IBOutlet weak var tblProductList: UITableView!
    
    var envelope: ProductListEnvelope!
    let identifier = "ProductListTableViewCell"
    var interactor: ProductListInteractor!
    var presenter: ProductListPresenter!
    var modelListDomain: [Domain.ViewModel]!
    var modelListDomainFiltered: [Domain.ViewModel]!
    var modelListSite: [Product.ViewModel]!
    var modelListSiteFiltered: [Product.ViewModel]!

    convenience init(envelope: ProductListEnvelope) {
        self.init()
        self.envelope = envelope
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.presenter = ProductListPresenter(vc: self)
        self.interactor = ProductListInteractor(presenter: self.presenter)
        self.prepareTable()
    }

    override func viewWillAppear(_ animated: Bool) {
        self.requireProductList()
    }
    
    private func prepareTable() {
        self.tblProductList.delegate = self
        self.tblProductList.dataSource = self
        self.tblProductList.register(UINib(nibName: self.identifier, bundle: nil), forCellReuseIdentifier: self.identifier)
    }

    // MARK: Present product list
    func presentProductListDomainAttribute(modelList: [Domain.ViewModel]) {
        self.removeSpinner()
        self.modelListDomain = modelList
        self.modelListDomainFiltered = self.modelListDomain
        self.tblProductList.reloadData()
    }
    
    func presentProductListSiteProduct(modelList: [Product.ViewModel]) {
        self.removeSpinner()
        self.modelListSite = modelList
        self.modelListSiteFiltered = self.modelListSite
        self.tblProductList.reloadData()
    }

    func presentError(error: Error) {
        self.removeSpinner()
        self.presentAlertKO(message: "No se pueden consultar recetas. Intentar mas tarde")
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

    // MARK: Business
    private func requireProductList() {
        self.createSpinnerView()
        self.interactor.requestProductListSiteProduct()
    }
}

// MARK: UITableView
extension ProductListViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        ProductListRouter().routeToProduct(from: self, to: ProductViewController(product: self.modelListDomainFiltered[indexPath.section].attributes[indexPath.row]))
    }
}

extension ProductListViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        if self.modelListSiteFiltered != nil && !self.modelListSiteFiltered.isEmpty {
            return self.modelListSiteFiltered.count
        } else {
            return 1
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let res = self.self.modelListSiteFiltered else { return 0 }
        return res.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 154
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let attribute = self.modelListSiteFiltered[indexPath.row]
        let cell = self.tblProductList.dequeueReusableCell(withIdentifier: self.identifier, for: indexPath) as! ProductListTableViewCell
        cell.lblProduct.text = attribute.title
        return cell
    }
}

class ProductListEnvelope {
    private var item: String!
    var findBy: String {
        get { return item }
    }
    
    convenience init(item: String) {
        self.init()
        self.item = item
    }
}
