//
//  MSMovieTableViewCell.swift
//  MovieSearch
//

import UIKit

class MSMovieTableViewCell: UITableViewCell {
    @IBOutlet weak var titleLabel : UILabel!
    @IBOutlet weak var yearLabel : UILabel!
    @IBOutlet weak var posterImage : UIImageView!
    @IBOutlet weak var typeLabel : UILabel!
    var representedIdentifier: String = ""

    var image: UIImage? {
      didSet {
          posterImage.image = image
      }
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        updateView()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func populateCellWithMovieData(movie:MSMovies){
        titleLabel.text = movie.title
        yearLabel.text = "Year \(movie.year)"
        typeLabel.text = movie.type.rawValue.uppercased()
    }
    
    func updateView(){
        self.backgroundColor = UIColor.clear
        self.titleLabel.textColor = UIColor.white
        self.yearLabel.textColor = UIColor.white
        self.typeLabel.textColor = UIColor.white
        self.titleLabel.font = MSHeaderFont
        self.yearLabel.font = MSTitleFont
        self.typeLabel.font = MSSubHeaderFont
    }
    
}
