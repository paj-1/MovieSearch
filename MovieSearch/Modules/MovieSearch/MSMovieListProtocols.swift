//
//  MSMovieListProtocols.swift
//  MovieSearch
//

import Foundation
import UIKit

protocol MSMovieListViewToPresenterProtocol: AnyObject {
    var view: MSMovieListPresenterToViewProtocol? {get set}
    var interactor: MSMovieListPresenterToInteractorProtocol? {get set}
    var router: MSMovieListPresenterToRouterProtocol? {get set}
    func startSearchMovieListForTitle(title:String)
    func numberOfSectionInTable()->Int
    func numberOfRowsInSection()->Int
    func getCell(tableView:UITableView, forRowAt indexPath:IndexPath) -> MSMovieTableViewCell
    func registerTableWithCell(tabelView:UITableView)
    func startFetchingPreviousSearchedText()
    func navigateToSearchHistory()
}

/**
 - MSMovieListPresenterToViewProtocol  - protocol methods used  view updates events from presenter to view
 */
protocol MSMovieListPresenterToViewProtocol : AnyObject{
    func startSearchMovieListSuccess()
    func startSearchMovieListFailure()
}

/**
 - MSMovieListPresenterToRouterProtocol  - protocol methods used  for navigtion
 */
protocol MSMovieListPresenterToRouterProtocol : AnyObject{
    
    static func createModule()-> MSMovieListViewController
    func navigateToSearchHistory(view : MSMovieListPresenterToViewProtocol?)
    
}

/**
 - MSMovieListPresenterToInteractorProtocol  - protocol methods used  for presenter to Interactor communication
 */
protocol MSMovieListPresenterToInteractorProtocol : AnyObject{
    var presenter:MSMovieListInteractorToPresenterProtocol? {get set}
    func searchMovieListForTitle(title: String)
    var  movieLists : MSMoviesList? {get set}
    func downLoadImageFromURL(ImageURL: String, completion: @escaping (Data?, Error?) -> (Void))
    func fetchPreviousSearchedText()
}

/**
 - MSMovieListInteractorToPresenterProtocol  - protocol methods used  for  Interactor to presentercommunication
 */
protocol MSMovieListInteractorToPresenterProtocol : AnyObject {
    func searchMovieListSuccess(movieList: MSMoviesList?)
    func searchMovieListFailure(error: Error?)
    func fetchPreviousSearchedTextSuccess(searchTexts:[String])
}


