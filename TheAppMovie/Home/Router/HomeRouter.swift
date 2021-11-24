//
//  HomeRouter.swift
//  TheAppMovie
//
//  Created by Rodrigo Torres on 22/11/2021.
//

import Foundation
import UIKit

class HomeRouter {
    
    var viewController: UIViewController {
        return createViewController()
    }
    
    private var sourceView: UIViewController?
    
    func createViewController() -> UIViewController {
        let view = HomeView(nibName: "HomeView", bundle: Bundle.main)
        view.title = "Peliculas Populares"
        return view
    }
    
    func setSourceView(_ sourceView: UIViewController?) {
        guard let view = sourceView else {fatalError("Error")}
        self.sourceView = view
    }    
    
}
