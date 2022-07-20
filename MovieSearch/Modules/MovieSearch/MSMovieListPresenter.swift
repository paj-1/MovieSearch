//
//  MSMovieListPresenter.swift
//  MovieSearch
//

import Foundation
import UIKit

class MSMovieListPresenter : MSMovieListViewToPresenterProtocol {
  
    weak var view: MSMovieListPresenterToViewProtocol?
    var interactor: MSMovieListPresenterToInteractorProtocol?
    var router: MSMovieListPresenterToRouterProtocol?
    var  movieLists : MSMoviesList?
    
    func startSearchMovieListForTitle(title: String) {
        interactor?.searchMovieListForTitle(title: title)
    }
    
    func registerTableWithCell(tabelView: UITableView) {
        tabelView.register(UINib(nibName: "MSMovieTableViewCell", bundle: nil), forCellReuseIdentifier: "MSMovieCell")
    }
    
    func startFetchingPreviousSearchedText() {
        interactor?.fetchPreviousSearchedText()
    }
    
    func numberOfSectionInTable() -> Int {
        return 1
    }
    
    func numberOfRowsInSection() -> Int {
        return movieLists?.search.count ?? 0
    }
    
    /**
     - Populating the searched movie list in the tableview
     */
    
    func getCell(tableView: UITableView, forRowAt indexPath: IndexPath) -> MSMovieTableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MSMovieCell", for: indexPath) as! MSMovieTableViewCell
        
        if let movie = movieLists?.search[indexPath.row] {
            cell.populateCellWithMovieData(movie: movie)
            let representedIdentifier = movie.title
            cell.representedIdentifier = representedIdentifier
            
            func image(data: Data?) -> UIImage? {
              if let data = data {
                return UIImage(data: data)
              }
              return UIImage(systemName: "pencil.slash")
            }
            
            interactor?.downLoadImageFromURL(ImageURL: movie.poster) {(data, error) in
                let img = image(data: data)
                DispatchQueue.main.async {
                  if (cell.representedIdentifier == representedIdentifier) {
                    cell.image = img
                  }
                }
                
            }
        }
        
        
        
        return cell
    }
    
    /**
     - Navigation to show searched history screen
     */
    
    func navigateToSearchHistory() {
        router?.navigateToSearchHistory(view: view)
    }
    
}


extension MSMovieListPresenter : MSMovieListInteractorToPresenterProtocol {
    func fetchPreviousSearchedTextSuccess(searchTexts: [String]) {
        
    }
    
    func searchMovieListFailure(error: Error?) {
        self.movieLists = nil
        view?.startSearchMovieListFailure()
        
    }
    
    func searchMovieListSuccess(movieList: MSMoviesList?) {
        self.movieLists = movieList
        view?.startSearchMovieListSuccess()
    }
    
    
    
}
