//
//  DetailViewModel.swift
//  JuniorProjectTesting
//
//  Created by Alikhan Tursunbekov on 26/1/24.
//

import Foundation

protocol DetailViewModelProtocol {
    var coinModel: DataModel { get }
    var changes: Double {get set}
}

class DetailViewModel: DetailViewModelProtocol {
    
    let coinModel: DataModel
    var changes = 0.0
    
    init(coinModel: DataModel) {
        self.coinModel = coinModel
        if let percentage = Double(coinModel.changePercent24Hr), let cost = Double(coinModel.priceUsd) {
            changes = percentage * cost / 100.0
        }
    }
}
