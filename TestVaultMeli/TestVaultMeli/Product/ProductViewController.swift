//
//  ProductViewController.swift
//  TestVaultMeli
//
//  Created by Juan Manuel Moreno on 28/07/23.
//

import UIKit

class ProductViewController: UIViewController {

    @IBOutlet weak var lblProduct: UILabel!
    
    var product: Attribute.ViewModel!
    
    convenience init(product: Attribute.ViewModel) {
        self.init()
        self.product = product
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.prepareProduct()
    }

    private func prepareProduct() {
        self.lblProduct.text = product.name
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
