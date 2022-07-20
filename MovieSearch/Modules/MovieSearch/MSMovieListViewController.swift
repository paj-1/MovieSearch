//
//  MSMovieListViewController.swift
//  MovieSearch
//

import UIKit

class MSMovieListViewController: MSBaseViewController {

    var presenter:MSMovieListViewToPresenterProtocol?

    @IBOutlet weak var searchMovieTextField : UISearchBar!
    @IBOutlet weak var searchMovieTableView : UITableView!
    @IBOutlet weak var showSearchHistoryButton : UIButton!
    @IBOutlet weak var DisplayLabel : UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateSubView()
        presenter?.registerTableWithCell(tabelView: searchMovieTableView)
        searchMovieTableView.delegate = self
        searchMovieTableView.dataSource = self
        searchMovieTextField.delegate = self
        self.title = "Movie Search"
        
        // Do any additional setup after loading the view.
    }
    
    override func updateSubViewForData<T>(data: T) {
        if let titleText = data as? String {
            searchMovieTextField.searchTextField.text = titleText
            presenter?.startSearchMovieListForTitle(title: titleText)
           
        }
    }
    
    private func updateSubView(){
        
        self.DisplayLabel.textColor = UIColor.white
        self.DisplayLabel.text = "Search for Movies"
        self.DisplayLabel.isHidden = false
        searchMovieTextField.backgroundImage = UIImage()
        searchMovieTextField.searchTextField.backgroundColor = UIColor.white
        
    }
    
    func searchMovieForTitle(title:String){
        presenter?.startSearchMovieListForTitle(title: title)
    }
    
    
    @IBAction func showSearchHistoryTriggered(_ sender : Any){
        presenter?.navigateToSearchHistory()
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

extension MSMovieListViewController : MSMovieListPresenterToViewProtocol {
    func startSearchMovieListSuccess() {
        DispatchQueue.main.async {
            self.DisplayLabel.isHidden = true
            self.searchMovieTableView.reloadData()
        }
        
    }
    
    func startSearchMovieListFailure() {
        DispatchQueue.main.async {
            self.DisplayLabel.isHidden = false
            self.DisplayLabel.text = "No search results found"
            self.searchMovieTableView.reloadData()
        }
        
    }
    
    
    
}


extension MSMovieListViewController: UITableViewDataSource,UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presenter?.numberOfRowsInSection() ?? 0
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = presenter?.getCell(tableView: tableView, forRowAt: indexPath)
        return cell!
    }
    
}
    
extension MSMovieListViewController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {

    }
    
    func searchBarTextDidBeginEditing(_ searchBar: UISearchBar){
        
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        searchBar.searchTextField.resignFirstResponder()
    }
    
    func searchBarTextDidEndEditing(_ searchBar: UISearchBar){
        if let title = searchBar.searchTextField.text{
            searchMovieForTitle(title: title)
            
        }
    }
}
    

