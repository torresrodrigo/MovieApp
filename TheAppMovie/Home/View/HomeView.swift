//
//  HomeView.swift
//  TheAppMovie
//
//  Created by Rodrigo Torres on 22/11/2021.
//

import UIKit

class HomeView: UIViewController {

    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    @IBOutlet weak var moviesTableView: UITableView!
    private var router = HomeRouter()
    private var viewModel = HomeViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.bind(view: self, router: router)
        setupTableView()
    }

}

extension HomeView: UITableViewDelegate, UITableViewDataSource {
    
    func setupTableView() {
        moviesTableView.register(MovieCell.nib(), forCellReuseIdentifier: MovieCell.identifier)
        moviesTableView.delegate = self
        moviesTableView.dataSource = self
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = moviesTableView.dequeueReusableCell(withIdentifier: MovieCell.identifier, for: indexPath) as! MovieCell
        return cell
    }
    
}

