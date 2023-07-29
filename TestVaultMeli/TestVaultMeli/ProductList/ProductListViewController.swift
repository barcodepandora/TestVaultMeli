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
    var modelList: [Domain.ViewModel]!
    var modelListFiltered: [Domain.ViewModel]!
    
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
    func presentProductList(modelList: [Domain.ViewModel]) {
        self.removeSpinner()
        self.modelList = modelList
        self.modelListFiltered = self.modelList
        self.tblProductList.reloadData()
    }

    func presentError(error: Error) {
        self.removeSpinner()
        let alert = UIAlertController(title: "Error", message: "No se pueden consultar recetas. Intentar mas tarde", preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
        self.present(alert, animated: true, completion: nil)
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
        self.interactor.requestProductList()
    }
}

// MARK: UITableView
extension ProductListViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        ProductListRouter().routeToProduct(from: self, to: ProductViewController(product: self.modelListFiltered[indexPath.section].attributes[indexPath.row]))
    }
}

extension ProductListViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        if self.modelListFiltered != nil && !self.modelListFiltered.isEmpty {
            return self.modelListFiltered.count
        } else {
            return 1
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let res = self.self.modelListFiltered else { return 0 }
        return res[section].attributes.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 154
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let attribute = self.modelListFiltered[indexPath.section].attributes[indexPath.row]

        let cell = self.tblProductList.dequeueReusableCell(withIdentifier: self.identifier, for: indexPath) as! ProductListTableViewCell
        cell.lblProduct.text = attribute.name
        return cell

//        let attribute = self.modelListFiltered[0][indexPath.row]
//
//        let cell = self.tblProductList.dequeueReusableCell(withIdentifier: self.identifier, for: indexPath) as! ProductListTableViewCell
//        cell.lblProduct.text = attribute.name
//        return cell

    }
}

class ProductListEnvelope {
    var item: String!
    
    convenience init(item: String) {
        self.init()
        self.item = item
    }
}
