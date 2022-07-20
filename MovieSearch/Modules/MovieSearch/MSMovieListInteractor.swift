//
//  MSMovieListInteractor.swift
//  MovieSearch.
//

import Foundation

class MSMovieListInteractor : MSMovieListPresenterToInteractorProtocol {
    
    var movieLists: MSMoviesList?

    weak var presenter: MSMovieListInteractorToPresenterProtocol?
    
    func searchMovieListForTitle(title: String) {
        
        MSNetworkManger.shared.getData(query: title, endPoint: .searchMovie, type: MSMoviesList.self){ [weak self] (response, error) in
            self?.saveSearchTitle(title: title)
            if error == nil {
                self?.movieLists = response
                
                self?.presenter?.searchMovieListSuccess(movieList: self?.movieLists)
            }
            else {
                self?.presenter?.searchMovieListFailure(error: error)
            }
        }
    }
    
    func downLoadImageFromURL(ImageURL: String, completion: @escaping (Data?, Error?) -> (Void)) {
        MSNetworkManger.shared.image(imagePath: ImageURL) { data, error  in
            completion(data,error)
        }
    }
    
    /**
     - Get the saved search results from userdefaults
     */
    
    func fetchPreviousSearchedText(){
        let userDefaults = UserDefaults.standard
        let searchList = userDefaults.object(forKey: searchMovieKey) as? [String] ?? []
        presenter?.fetchPreviousSearchedTextSuccess(searchTexts: searchList)
    }
    
    /**
     - Saving the searched results
     */
    
    private func saveSearchTitle(title: String){
        let userDefaults = UserDefaults.standard
        var searchList = userDefaults.object(forKey: searchMovieKey) as? [String] ?? []
        if !searchList.contains(title) && !title.isEmptyOrWhitespace(){
            searchList.append(title)
            userDefaults.set(searchList, forKey: searchMovieKey)
        }
    }
}
