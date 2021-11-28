//
//  APIManager.swift
//  TheAppMovie
//
//  Created by Rodrigo Torres on 22/11/2021.
//

import Foundation
import RxSwift
import Alamofire

class APIManager {
    
    func getPopularMovies() -> Observable<[Movie]> {
        return Observable.create { observer in
            let requestReference = AF.request(Constants.URL.main+Constants.Endpoints.urlListPopularMovies+Constants.apiKey).responseDecodable(of: Movies.self) { response in
                switch response.result {
                case .success(let data):
                    observer.onNext(data.listOfMovies)
                    observer.onCompleted()
                case .failure(let error):
                    observer.onError(error.underlyingError!)
                }
            }
            return Disposables.create {
                requestReference.cancel()
            }
        }
    }
    
    func getDetailMovie(id: Int) -> Observable<DetailMovie> {
        let idString = String(describing: id)
        let finalUrl = Constants.URL.main+Constants.Endpoints.urlDetailMovie+idString+Constants.apiKey
        return Observable.create { observer in
            let requestReference = AF.request(finalUrl).responseDecodable(of: DetailMovie.self) {
                response in
                switch response.result {
                case .success(let data):
                    observer.onNext(data)
                    observer.onCompleted()
                case .failure(let error):
                    observer.onError(error.underlyingError!)
                }
            }
            return Disposables.create {
                requestReference.cancel()
            }
        }
    }
}
