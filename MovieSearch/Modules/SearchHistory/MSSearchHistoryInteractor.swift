//
//  MSSearchHistoryInteractor.swift
//  MovieSearch
//

import Foundation

/**
 -  Logic to fetch the searched results saved in UserDefaults. It helps in displaying and selecting the list of saved search results
 */

class MSSearchHistoryInteractor : MSSearchHistoryPresenterToInteractorProtocol {
    weak var presenter: MSSearchHistoryInteractorToPresenterProtocol?
    
    func fetchPreviousSearchedText() {
        let userDefaults = UserDefaults.standard
        let searchList = userDefaults.object(forKey: searchMovieKey) as? [String] ?? []
        presenter?.fetchPreviousSearchedTextSuccess(searchTexts: searchList)
    }
    
   
    
   

    
}
