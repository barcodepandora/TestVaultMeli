//
//  XploreViewController.swift
//  TestVaultMeli
//
//  Created by Juan Manuel Moreno on 28/07/23.
//

import UIKit

class XploreViewController: UIViewController {

    @IBOutlet weak var txtXplore: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    @IBAction func didXplore(_ sender: Any) {
        do {
            try XploreRouter().routeToProductList(from: self, to: ProductListViewController(envelope: ProductListEnvelope(item: self.txtXplore.text!)))
        } catch MeliError.findByIsEmpty {
            let alert = UIAlertController(title: "Error", message: "Escribir un producto", preferredStyle: UIAlertController.Style.alert)
            alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
            self.present(alert, animated: true, completion: nil)
        } catch {}
        
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
