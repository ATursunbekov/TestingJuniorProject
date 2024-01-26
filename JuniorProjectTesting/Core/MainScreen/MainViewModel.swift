//
//  MainViewModel.swift
//  JuniorProjectTesting
//
//  Created by Alikhan Tursunbekov on 25/1/24.
//

import UIKit

protocol MainDelegate: AnyObject {
    func successResult()
}

protocol MainViewModelProtcol {
    var coins: [DataModel] {get set}
    var delegate: MainDelegate? {get set}
    
    func fetchCoins()
}

class MainViewModel: MainViewModelProtcol {
    var delegate: MainDelegate?
    var coins: [DataModel] = []
    
    func fetchCoins() {
        let url = "https://api.coincap.io/v2/assets"
        let header = ["Content-Type" : "application/json"]
        
        NetworkManager.request(urlString: url,method: .get ,headers: header) { (result: Result<MainModel, NetworkError>)  in
            switch result {
            case .success(let res):
                self.coins = res.data
                self.delegate?.successResult()
            case .failure(let error):
                print(error)
            }
        }
    }
}
