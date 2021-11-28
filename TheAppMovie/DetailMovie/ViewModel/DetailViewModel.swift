//
//  DetailViewModel.swift
//  TheAppMovie
//
//  Created by Rodrigo Torres on 27/11/2021.
//

import Foundation
import RxSwift

class DetailViewModel {
    private weak var view: DetailView?
    private(set) var router: DetailRouter?
    private var apiManager = APIManager()
    
    func bind(view: DetailView, router: DetailRouter) {
        self.view = view
        self.router = router
    }
    
    func getMovieData(movieID: Int) -> Observable<DetailMovie> {
        return apiManager.getDetailMovie(id: movieID)
    }
}
