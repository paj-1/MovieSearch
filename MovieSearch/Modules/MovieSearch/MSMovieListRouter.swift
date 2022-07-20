//
//  MSMovieListRouter.swift
//  MovieSearch
//

import Foundation

/**
 - Logic for instantiating the home view controller 
 */

class MSMovieListRouter : MSMovieListPresenterToRouterProtocol {
    
    static func createModule() -> MSMovieListViewController {
        
        let view = mainstoryboard.instantiateViewController(withIdentifier: "MSMovieListViewController") as! MSMovieListViewController
        let presenter: MSMovieListViewToPresenterProtocol & MSMovieListInteractorToPresenterProtocol = MSMovieListPresenter()
        let interactor: MSMovieListPresenterToInteractorProtocol = MSMovieListInteractor()
        let router:MSMovieListPresenterToRouterProtocol = MSMovieListRouter()
        view.presenter = presenter
        presenter.view = view
        presenter.router = router
        presenter.interactor = interactor
        interactor.presenter = presenter
        return view
        
    }
    
    func navigateToSearchHistory(view: MSMovieListPresenterToViewProtocol?) {
        if let viewController = view as? MSMovieListViewController {
             let searchHistoryView = MSSearchHistoryRouter.createModule()
            viewController.navigationController?.pushViewController(searchHistoryView, animated: true)
        }
    }
    
    
}
