//
//  MovieCell.swift
//  TheAppMovie
//
//  Created by Rodrigo Torres on 22/11/2021.
//

import UIKit
import SDWebImage

class MovieCell: UITableViewCell {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var imageMovie: UIImageView!
    static let identifier = String(describing: MovieCell.self)
    static func nib() -> UINib {
        return UINib(nibName: "MovieCell", bundle: nil)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setupCell(data: Movie) {
        titleLabel.text = data.title
        getImage(imgUrl: data.imageMovie)
    }
    
    func getImage(imgUrl: String?) {
        if let path = imgUrl {
            imageMovie.sd_setImage(with: URL(string: Constants.URL.urlImages+path))
        }
    }
    
}
