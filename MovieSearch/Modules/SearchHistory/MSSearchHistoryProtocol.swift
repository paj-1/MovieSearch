//
//  MSSearchHistoryProtocol.swift
//  MovieSearch
//

import Foundation
import UIKit

protocol MSSearchHistoryViewToPresenterProtocol: AnyObject {
    var view: MSSearchHistoryPresenterToViewProtocol? {get set}
    var interactor: MSSearchHistoryPresenterToInteractorProtocol? {get set}
    var router: MSSearchHistoryPresenterToRouterProtocol? {get set}
    func numberOfSectionInTable()->Int

    func numberOfRowsInSection()->Int
    func getCell(tableView:UITableView, forRowAt indexPath:IndexPath) -> UITableViewCell
    func registerTableWithCell(tabelView:UITableView)
    func startFetchingPreviousSearchedText()
    func didSelectTitleAtIndex(indexPath:IndexPath)
}


protocol MSSearchViewToPresenterProtocol : MSSearchHistoryViewToPresenterProtocol {
    
}


/**
 - MSSearchHistoryPresenterToViewProtocol  - protocol methods used  view updates events from presenter to view
 */
protocol MSSearchHistoryPresenterToViewProtocol : AnyObject{
    func startFetchingPreviousSearchedTextSuccess()
}

/**
 - MSSearchHistoryPresenterToRouterProtocol  - protocol methods used  for navigtion
 */
protocol MSSearchHistoryPresenterToRouterProtocol : AnyObject{
    
    static func createModule()-> MSSearchHistoryViewController
    func navigateToBack(view : MSSearchHistoryPresenterToViewProtocol?, title:String)
}

/**
 - MSSearchHistoryPresenterToInteractorProtocol  - protocol methods used  for presenter to Interactor communication
 */
protocol MSSearchHistoryPresenterToInteractorProtocol : AnyObject{
    var presenter:MSSearchHistoryInteractorToPresenterProtocol? {get set}
    func fetchPreviousSearchedText()
}

/**
 - MSSearchHistoryInteractorToPresenterProtocol  - protocol methods used  for
 Interactor to presentercommunication
 */
protocol MSSearchHistoryInteractorToPresenterProtocol : AnyObject {
    func fetchPreviousSearchedTextSuccess(searchTexts:[String])
}
