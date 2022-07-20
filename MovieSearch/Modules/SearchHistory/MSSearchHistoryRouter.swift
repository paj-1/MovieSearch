//
//  MSSearchHistoryRouter.swift
//  MovieSearch
//

import Foundation

/**
 - Navigation logic between search screen and search history screen
 */

class MSSearchHistoryRouter : MSSearchHistoryPresenterToRouterProtocol {
    
    static func createModule() -> MSSearchHistoryViewController {
        
        let view = mainstoryboard.instantiateViewController(withIdentifier: "MSSearchHistoryViewController") as! MSSearchHistoryViewController
        let presenter: MSSearchHistoryViewToPresenterProtocol & MSSearchHistoryInteractorToPresenterProtocol = MSSearchHistoryPresenter()
        let interactor: MSSearchHistoryPresenterToInteractorProtocol = MSSearchHistoryInteractor()
        let router:MSSearchHistoryPresenterToRouterProtocol = MSSearchHistoryRouter()
        view.presenter = presenter
        presenter.view = view
        presenter.router = router
        presenter.interactor = interactor
        interactor.presenter = presenter
        return view
        
    }
    
    func navigateToBack(view: MSSearchHistoryPresenterToViewProtocol?, title: String) {
        if let viewController = view as? MSSearchHistoryViewController {
            if let navController =  viewController.navigationController as? MSNavigationControllerViewController {
                navController.msNavigationDelegate?.refreshViewController(data: title)
                navController.popViewController(animated: false)
            }
            
        }
    }
    
    
}
