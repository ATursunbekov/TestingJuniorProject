//
//  DetailViewController.swift
//  JuniorProjectTesting
//
//  Created by Alikhan Tursunbekov on 26/1/24.
//

import UIKit

class DetailViewController: UIViewController {

    let detailView = DetailView()
    var viewModel: DetailViewModelProtocol
    
    init(viewModel: DetailViewModelProtocol) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.hidesBackButton = true
        navigationController?.navigationBar.isUserInteractionEnabled = false
        setupTargets()
        setupView()
    }
    
    override func loadView() {
        self.view = detailView
    }
    
    func setupTargets() {
        detailView.backButton.addTarget(self, action: #selector(popBack), for: .touchUpInside)
    }
    
    func setupView() {
        detailView.titleLabel.text = viewModel.coinModel.name
        if let cost = formatNumberString(viewModel.coinModel.priceUsd) {
            detailView.cost.text = "$ \(cost)"
        }
        var sign = 0
        if let change = Double(viewModel.coinModel.changePercent24Hr) {
            if change > 0 {
                detailView.showChange.textColor = UIColor(hex: "#21BF73")
                sign = 1
            } else if change < 0 {
                detailView.showChange.textColor = UIColor(hex: "#D90429")
                sign = -1
            } else {
                detailView.showChange.textColor = .white
                sign = 0
            }
        }
        
        if let percentage = formatNumberString(viewModel.coinModel.changePercent24Hr), let changeAmount = formatNumberString(String(viewModel.changes)) {
            var changes = " \(changeAmount) (\(percentage)%)"
            if sign > 0 {
                changes = "+ \(changes)"
            } else if sign < 0 {
                changes = changes.filter { $0 != "-" }
                changes = "- \(changes)"
            }
            detailView.showChange.text = changes
        }
        
        detailView.marketCupData.text = formatNumber(viewModel.coinModel.marketCapUsd)
        detailView.supplyData.text = formatNumber(viewModel.coinModel.supply)
        detailView.volumeData.text = formatNumber(viewModel.coinModel.volumeUsd24Hr)
    }
    
    func formatNumberString(_ numberString: String) -> String? {
        if let originalNumber = Double(numberString) {
            return String(format: "%.2f", originalNumber)
        } else {
            return nil
        }
    }
    
    func formatNumber(_ numberString: String) -> String {
        guard let number = Double(numberString) else {
            return "Invalid Number"
        }

        let numberFormatter = NumberFormatter()
        numberFormatter.minimumFractionDigits = 0
        numberFormatter.maximumFractionDigits = 2

        var formattedNumber: String

        switch number {
        case 0..<1_000_000:
            formattedNumber = numberFormatter.string(from: NSNumber(value: number)) ?? "\(number)"
        case 1_000_000..<1_000_000_000:
            let millionValue = number / 1_000_000
            formattedNumber = "\(numberFormatter.string(from: NSNumber(value: millionValue)) ?? "\(millionValue)")m"
        default:
            let billionValue = number / 1_000_000_000
            formattedNumber = "\(numberFormatter.string(from: NSNumber(value: billionValue)) ?? "\(billionValue)")b"
        }

        return formattedNumber
    }
    
    @objc func popBack() {
        navigationController?.popViewController(animated: true)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
