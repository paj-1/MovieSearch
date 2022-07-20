//
//  MSBaseViewController.swift
//  MovieSearch
//

import UIKit

class MSBaseViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.configureGradientLayer()
        let textAttributes = [NSAttributedString.Key.foregroundColor:UIColor.white]
        navigationController?.navigationBar.titleTextAttributes = textAttributes
        navigationController?.navigationBar.tintColor = UIColor.white

        // Do any additional setup after loading the view.
    }
    
    
    func updateSubViewForData<T:Any>(data: T) {
        // Subclass override this method
    }

    func configureGradientLayer(){
        self.view.backgroundColor = .clear
        let gradient = CAGradientLayer()
        gradient.colors = [UIColor.gray.cgColor, UIColor.systemBlue.cgColor]
        gradient.locations = [0, 1]
        gradient.frame = self.view.bounds
        self.view.layer.insertSublayer(gradient, at: 0)
    }

}

/**
 - Refresh the home screen with searched data
 */

extension MSBaseViewController :  MSNavigationControllerViewControllerDelegate {
    
    func refreshViewController<T>(data: T) {
        updateSubViewForData(data: data)
    }
    
}
