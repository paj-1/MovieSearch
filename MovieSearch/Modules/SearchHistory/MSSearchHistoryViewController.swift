//
//  MSSearchHistoryViewController.swift
//  MovieSearch
//

import UIKit

/**
 - This view controller displays the list of searches the user has searched previously
 */

class MSSearchHistoryViewController: MSBaseViewController {

    var presenter:MSSearchHistoryViewToPresenterProtocol?
    @IBOutlet weak var titleTableView : UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.registerTableWithCell(tabelView: titleTableView)
        titleTableView.delegate = self
        titleTableView.dataSource = self
        presenter?.startFetchingPreviousSearchedText()
        self.title = "Search History"
        // Do any additional setup after loading the view.
    }
    
}


extension MSSearchHistoryViewController : MSSearchHistoryPresenterToViewProtocol {
    func startFetchingPreviousSearchedTextSuccess() {
        titleTableView.reloadData()
    }
    
    
}

/**
 - Tableview override methods
 */

extension MSSearchHistoryViewController: UITableViewDataSource,UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presenter?.numberOfRowsInSection() ?? 0
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = presenter?.getCell(tableView: tableView, forRowAt: indexPath)
        return cell!
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        presenter?.didSelectTitleAtIndex(indexPath: indexPath)
    }
    
}
  
