//
//  DetailRouter.swift
//  TheAppMovie
//
//  Created by Rodrigo Torres on 27/11/2021.
//

import Foundation
import UIKit

class DetailRouter {
    
    var viewController: UIViewController {
        return createViewController()
    }
    
    var movieID: Int?
    var movieImage: String?
    private var sourceView: UIViewController?
    
    init(movieID: Int? = 0, moviePath: String? = "") {
        self.movieID = movieID
        self.movieImage = moviePath
    }
    
    func createViewController() -> UIViewController {
        let view = DetailView(nibName: "DetailView", bundle: Bundle.main)
        view.title = "Detalle"
        view.movieID = self.movieID
        view.movieImagePath = self.movieImage
        return view
    }
    
    func setSourceView(_ sourceView: UIViewController?) {
        guard let view = sourceView else {fatalError("Error")}
        self.sourceView = view
    }
    
}
