//
//  MainModel.swift
//  JuniorProjectTesting
//
//  Created by Alikhan Tursunbekov on 25/1/24.
//

import Foundation

struct MainModel: Codable {
    let data: [DataModel]
}

struct DataModel: Codable {
    let id: String
    let rank: String
    let symbol: String
    let name: String
    let supply: String
    let maxSupply: String?
    let marketCapUsd: String
    let volumeUsd24Hr: String
    let priceUsd: String
    let changePercent24Hr: String
    let vwap24Hr: String?
    let explorer: String?
}
