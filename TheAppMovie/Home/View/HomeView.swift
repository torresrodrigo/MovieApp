//
//  HomeView.swift
//  TheAppMovie
//
//  Created by Rodrigo Torres on 22/11/2021.
//

import UIKit
import RxSwift

class HomeView: UIViewController {

    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    @IBOutlet weak var moviesTableView: UITableView!
    private var router = HomeRouter()
    private var viewModel = HomeViewModel()
    private var disposeBag = DisposeBag()
    private var movies = [Movie]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.bind(view: self, router: router)
        getData()
        setupTableView()
    }
    
    private func getData() {
        return viewModel.getListMoviesData()
            .subscribe(on: MainScheduler.instance)
            .observe(on: MainScheduler.instance)
            .subscribe { movies in
                self.movies = movies
                self.reloadTableView()
                print(self.movies)
            } onError: { error in
                print(error.localizedDescription)
            } onCompleted: {
                
            }.disposed(by: disposeBag)
    }
    
    private func reloadTableView() {
        DispatchQueue.main.async {
            self.moviesTableView.reloadData()
        }
    }

}

extension HomeView: UITableViewDelegate, UITableViewDataSource {
    
    func setupTableView() {
        moviesTableView.register(MovieCell.nib(), forCellReuseIdentifier: MovieCell.identifier)
        moviesTableView.delegate = self
        moviesTableView.dataSource = self
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return movies.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = moviesTableView.dequeueReusableCell(withIdentifier: MovieCell.identifier, for: indexPath) as! MovieCell
        cell.textLabel?.text = movies[indexPath.row].title
        return cell
    }
    
}

