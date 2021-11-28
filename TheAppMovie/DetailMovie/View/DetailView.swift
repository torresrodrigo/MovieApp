//
//  DetailView.swift
//  TheAppMovie
//
//  Created by Rodrigo Torres on 27/11/2021.
//

import UIKit
import RxSwift
import SDWebImage

class DetailView: UIViewController {

    @IBOutlet weak var titleHeader: UILabel!
    @IBOutlet weak var imageMovie: UIImageView!
    @IBOutlet weak var languageLabel: UILabel!
    @IBOutlet weak var generLabel: UILabel!
    @IBOutlet weak var realeaseDateLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var statusLabel: UILabel!
    @IBOutlet weak var originalTitle: UILabel!
    
    private var viewModel = DetailViewModel()
    private var router = DetailRouter()
    private var disposeBag = DisposeBag()
    var movieID: Int?
    var movieImagePath: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        getDataAndShowDetail()
        viewModel.bind(view: self, router: router)
    }
    
    private func getDataAndShowDetail() {
        guard let id = movieID else { return }
        
        return viewModel.getMovieData(movieID: id).subscribe{ movie in
            self.showDataUI(movie: movie)
            print(movie)
        } onError: { error in
            print("Ha ocurrido un error: \(error)")
        } onCompleted: {
            
        }.disposed(by: disposeBag)

    }
    
    private func showDataUI(movie: DetailMovie) {
        DispatchQueue.main.async {
            self.titleHeader.text = movie.title
            self.languageLabel.text = self.setLanguage(language: movie.originalLanguage)
            self.generLabel.text = movie.genres[0].name
            self.realeaseDateLabel.text = movie.realeaseDate.convertDateFormater()
            self.scoreLabel.text = String(describing: movie.average)
            self.statusLabel.text = movie.status
            self.originalTitle.text = movie.originalTitle
            self.getImage(imgUrl: self.movieImagePath)
        }
    }
    
    func getImage(imgUrl: String?) {
        if let path = imgUrl {
            imageMovie.sd_setImage(with: URL(string: Constants.URL.urlImages+path))
        }
    }
    
    func setLanguage(language: String) -> String {
        switch language {
        case "en":
            return "English"
        case "ru":
            return "Russian"
        case "es":
            return "Español"
        default:
            return "Other Language"
        }
    }

}
