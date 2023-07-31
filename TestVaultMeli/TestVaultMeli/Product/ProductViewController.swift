//
//  ProductViewController.swift
//  TestVaultMeli
//
//  Created by Juan Manuel Moreno on 28/07/23.
//

import UIKit

class ProductViewController: UIViewController {

    @IBOutlet weak var lblProduct: UILabel!
    @IBOutlet weak var imageProduct: UIImageView!
    
    var product: Product.ViewModel!
    
    convenience init(product: Product.ViewModel) {
        self.init()
        self.product = product
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.prepareProduct()
    }

    private func prepareProduct() {
        self.lblProduct.text = product.title
        self.imageProduct.setImageWithURL(URL(string: product.thumbnail.replacingOccurrences(of: "http:/", with: "https:/"))!)
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
