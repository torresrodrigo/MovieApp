//
//  HomeViewModel.swift
//  TheAppMovie
//
//  Created by Rodrigo Torres on 22/11/2021.
//

import Foundation
import RxSwift

class HomeViewModel {
    private weak var view: HomeView?
    private var router: HomeRouter?
    private var apiManager = APIManager()
    
    func bind(view: HomeView, router: HomeRouter) {
        self.view = view
        self.router = router
        self.router?.setSourceView(view)
    }
    
    func getListMoviesData() -> Observable<[Movie]> {
        return apiManager.getPopularMovies()
    }
    
    func makeDetailView(movieID: Int, moviePath: String?) {
        guard let path = moviePath else { return }
        router?.navigateToDetailView(movieID: movieID, pathImage: path)
    }
    
}
