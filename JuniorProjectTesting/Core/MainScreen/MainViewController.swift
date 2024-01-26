//
//  ViewController.swift
//  JuniorProjectTesting
//
//  Created by Alikhan Tursunbekov on 24/1/24.
//

import UIKit

class MainViewController: UIViewController, UITextFieldDelegate {
    
    let mainView = MainView()
    var viewModel: MainViewModelProtcol
    var coinData: [DataModel] = []
    
    init(viewModel: MainViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupDelegates()
        viewModel.fetchCoins()
        setupTargets()
    }
    
    override func viewIsAppearing(_ animated: Bool) {
        navigationController?.navigationBar.isUserInteractionEnabled = false
    }
    
    override func loadView() {
        self.view = mainView
    }
    
    func setupDelegates() {
        mainView.tableView.delegate = self
        mainView.tableView.dataSource = self
        mainView.searchBar.textField.delegate = self
        viewModel.delegate = self
    }
    
    func textFieldDidChangeSelection(_ textField: UITextField) {
        guard let searchText = textField.text else { return }
        filterCoins(with: searchText)
    }
    
    func filterCoins(with searchText: String) {
        if searchText.isEmpty {
            coinData = viewModel.coins
            mainView.tableView.reloadData()
        } else {
            coinData = viewModel.coins.filter { coin in
                return coin.name.lowercased().contains(searchText.lowercased()) ||
                coin.symbol.lowercased().contains(searchText.lowercased())
            }
            mainView.tableView.reloadData()
        }
    }
    
    func setupTargets() {
        mainView.refreshControl.addTarget(self, action: #selector(refresh(_:)), for: .valueChanged)
    }
    
    @objc func refresh(_ sender: AnyObject) {
        viewModel.fetchCoins()
        mainView.tableView.reloadData()
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
            self.mainView.refreshControl.endRefreshing()
        }
    }
}

extension MainViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return coinData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: CustomTableViewCell.identifier, for: indexPath) as! CustomTableViewCell
        cell.cinfigureData(coinData: coinData[indexPath.row])
        cell.selectionStyle = .none
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let secondViewController = DetailViewController(viewModel: DetailViewModel(coinModel: coinData[indexPath.row]))
        navigationController?.pushViewController(secondViewController, animated: false)
    }
}

extension MainViewController: MainDelegate {
    func successResult() {
        DispatchQueue.main.async {
            self.coinData = self.viewModel.coins
            self.mainView.tableView.reloadData()
        }
    }
}
