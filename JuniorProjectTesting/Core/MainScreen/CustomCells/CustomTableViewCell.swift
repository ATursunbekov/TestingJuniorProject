//
//  CustomTableViewCell.swift
//  JuniorProjectTesting
//
//  Created by Alikhan Tursunbekov on 25/1/24.
//

import UIKit
import SnapKit
import Kingfisher

class CustomTableViewCell: UITableViewCell {
    static let identifier = "CustomTableViewCell"
    
    lazy var logoView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(hex: "#FFFFFF", alpha: 0.1)
        view.layer.cornerRadius = 12
        return view
    }()
    
    lazy var logoImage: UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleAspectFit
        return image
    }()
    
    lazy var name: UILabel = {
        let label = UILabel()
        label.text = "Bitcoin"
        label.textColor = .white
        label.font = UIFont(name: "SFProDisplay-Regular", size: 16)
        return label
    }()
    
    lazy var shortName: UILabel = {
        let label = UILabel()
        label.text = "BTC"
        label.textColor = UIColor.white.withAlphaComponent(0.7)
        label.font = UIFont(name: "SFProDisplay-Regular", size: 14)
        return label
    }()
    
    lazy var cost: UILabel = {
        let label = UILabel()
        label.text = "$ 22 678.48"
        label.textColor = .white
        label.font = UIFont(name: "SFProDisplay-Regular", size: 16)
        return label
    }()
    
    lazy var changes: UILabel = {
        let label = UILabel()
        label.text = "+ 4.32%"
        label.textColor = UIColor(hex: "#21BF73")
        label.font = UIFont(name: "SFProDisplay-Regular", size: 14)
        return label
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupConstraints()
        layer.backgroundColor = UIColor.clear.cgColor
        backgroundColor = .clear
    }
    
    func setupConstraints() {
        contentView.addSubview(logoView)
        contentView.addSubview(name)
        contentView.addSubview(shortName)
        contentView.addSubview(cost)
        contentView.addSubview(changes)
        logoView.addSubview(logoImage)
        
        logoView.snp.makeConstraints { make in
            make.leading.equalToSuperview()
            make.centerY.equalToSuperview()
            make.height.equalTo(48)
            make.width.equalTo(48)
        }
        
        name.snp.makeConstraints { make in
            make.leading.equalTo(logoView.snp.trailing).offset(10)
            make.top.equalToSuperview().offset(17)
        }
        
        shortName.snp.makeConstraints { make in
            make.leading.equalTo(logoView.snp.trailing).offset(10)
            make.bottom.equalToSuperview().offset(-17)
        }
        
        cost.snp.makeConstraints { make in
            make.trailing.equalToSuperview()
            make.top.equalToSuperview().offset(17)
        }
        
        changes.snp.makeConstraints { make in
            make.trailing.equalToSuperview()
            make.bottom.equalToSuperview().offset(-17)
        }
        
        logoImage.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.centerX.equalToSuperview()
            make.height.equalTo(35)
            make.width.equalTo(35)
        }
    }
    
    func cinfigureData(coinData: DataModel) {
        name.text = coinData.name
        shortName.text = coinData.symbol
        if let priceUsd = formatNumberString(coinData.priceUsd) {
            cost.text = "$ \(priceUsd)"
        }
        
        if var changePercent24Hr = formatNumberString(coinData.changePercent24Hr) {
            if let change = Double(changePercent24Hr) {
                if change > 0 {
                    changes.textColor = UIColor(hex: "#21BF73")
                    changePercent24Hr = "+ \(changePercent24Hr)%"
                } else if change < 0 {
                    changes.textColor = UIColor(hex: "#D90429")
                    changePercent24Hr = "- \(changePercent24Hr.filter { $0 != "-" })%"
                } else {
                    changes.textColor = .white
                    changePercent24Hr = changePercent24Hr.filter { $0 != "-" }
                }
            }
            changes.text = changePercent24Hr
        }
        
        let imageUrl = URL(string: "https://coinicons-api.vercel.app/api/icon/\(coinData.symbol.lowercased())")
        logoImage.kf.setImage(with: imageUrl)
    }
    
    func formatNumberString(_ numberString: String) -> String? {
        if let originalNumber = Double(numberString) {
            return String(format: "%.2f", originalNumber)
        } else {
            return nil
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

}
