//
//  MSSearchHistoryPresenter.swift
//  MovieSearch
//

import Foundation
import UIKit

/**
 - Presenter class to communicate between the searched results screen and the main search screen. Selecting  the searched results will help to re-search 
 */

class MSSearchHistoryPresenter : MSSearchHistoryViewToPresenterProtocol {
 
    weak var view: MSSearchHistoryPresenterToViewProtocol?
    
    var interactor: MSSearchHistoryPresenterToInteractorProtocol?
    
    var router: MSSearchHistoryPresenterToRouterProtocol?
    
    var searchedMovieTitle : [String] = []
    
    func numberOfSectionInTable() -> Int {
        return 1
    }
    
    func numberOfRowsInSection() -> Int {
        return searchedMovieTitle.count
    }
    
    func getCell(tableView: UITableView, forRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "msTitlCell", for: indexPath) as UITableViewCell
        cell.backgroundColor = UIColor.clear
        cell.textLabel?.textColor = .white
        cell.textLabel?.text = searchedMovieTitle[indexPath.row]
        return cell
    
    }
    
    func registerTableWithCell(tabelView: UITableView) {
        tabelView.register(UITableViewCell.self, forCellReuseIdentifier: "msTitlCell")
    }
    
    func startFetchingPreviousSearchedText() {
        interactor?.fetchPreviousSearchedText()
    }
    
    func didSelectTitleAtIndex(indexPath:IndexPath){
        
        router?.navigateToBack(view: view, title: searchedMovieTitle[indexPath.row])
    }
    
    
}


extension MSSearchHistoryPresenter : MSSearchHistoryInteractorToPresenterProtocol {
    func fetchPreviousSearchedTextSuccess(searchTexts: [String]) {
        searchedMovieTitle  =  searchTexts;
        view?.startFetchingPreviousSearchedTextSuccess()
    }
    
    
}
