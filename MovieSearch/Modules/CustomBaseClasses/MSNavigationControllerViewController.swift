//
//  MSNavigationControllerViewController.swift
//  MovieSearch
//

import UIKit

protocol MSNavigationControllerViewControllerDelegate {
    func refreshViewController<T:Any>(data:T)
}


class MSNavigationControllerViewController: UINavigationController {
    var msNavigationDelegate : MSNavigationControllerViewControllerDelegate?
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
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


extension MSNavigationControllerViewControllerDelegate {
    
    func refreshViewController<T:Any>(data:T){
        
    }
}
