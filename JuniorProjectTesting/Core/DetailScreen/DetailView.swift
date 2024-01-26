//
//  DetailView.swift
//  JuniorProjectTesting
//
//  Created by Alikhan Tursunbekov on 26/1/24.
//

import UIKit

class DetailView: UIView {
    
    lazy var bgImage: UIImageView = {
        let image = UIImageView(image: UIImage(named: "bg"))
        image.contentMode = .scaleToFill
        return image
    }()
    
    lazy var backButton: UIButton = {
        let button = UIButton()
        button.layer.borderColor = UIColor(hex: "#FFFFFF", alpha: 0.3).cgColor
        button.layer.borderWidth = 1
        button.layer.cornerRadius = 12
        button.tintColor = .white
        return button
    }()
    
    lazy var backImage: UIImageView = {
        let image = UIImageView(image: UIImage(named: "back"))
        image.contentMode = .scaleAspectFit
        return image
    }()
    
    lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.text = "Bitcoin"
        label.font = UIFont(name: "SFProDisplay-Bold", size: 24)
        label.textColor = .white
        return label
    }()
    
    lazy var cost: UILabel = {
        let label = UILabel()
        label.text = ""
        label.font = UIFont(name: "SFProDisplay-Regular", size: 24)
        label.textColor = .white
        return label
    }()
    
    lazy var showChange: UILabel = {
        let label = UILabel()
        label.text = ""
        label.font = UIFont(name: "SFProDisplay-Regular", size: 16)
        label.textColor = .white
        return label
    }()
    
    lazy var marketCup: UILabel = {
        let label = UILabel()
        label.text = "Market Cap"
        label.font = UIFont(name: "SFProDisplay-Regular", size: 14)
        label.textColor = UIColor(hex: "#FFFFFF", alpha: 0.5)
        return label
    }()
    
    lazy var supply: UILabel = {
        let label = UILabel()
        label.text = "Supply"
        label.font = UIFont(name: "SFProDisplay-Regular", size: 14)
        label.textColor = UIColor(hex: "#FFFFFF", alpha: 0.5)
        return label
    }()
    
    lazy var volume: UILabel = {
        let label = UILabel()
        label.text = "Volume 24Hr"
        label.font = UIFont(name: "SFProDisplay-Regular", size: 14)
        label.textColor = UIColor(hex: "#FFFFFF", alpha: 0.5)
        return label
    }()
    
    lazy var column1: UIView = {
       let view = UIView()
        view.backgroundColor = UIColor(hex: "#FFFFFF", alpha: 0.5)
        return view
    }()
    
    lazy var column2: UIView = {
       let view = UIView()
        view.backgroundColor = UIColor(hex: "#FFFFFF", alpha: 0.5)
        return view
    }()
    
    lazy var marketCupData: UILabel = {
        let label = UILabel()
        label.text = ""
        label.font = UIFont(name: "SFProDisplay-Regular", size: 16)
        label.textColor = .white
        return label
    }()
    
    lazy var supplyData: UILabel = {
        let label = UILabel()
        label.text = ""
        label.font = UIFont(name: "SFProDisplay-Regular", size: 16)
        label.textColor = .white
        return label
    }()
    
    lazy var volumeData: UILabel = {
        let label = UILabel()
        label.text = ""
        label.font = UIFont(name: "SFProDisplay-Regular", size: 16)
        label.textColor = .white
        return label
    }()


    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupConstraints()
    }
    
    func setupConstraints() {
        addSubview(bgImage)
        addSubview(backButton)
        addSubview(titleLabel)
        backButton.addSubview(backImage)
        addSubview(cost)
        addSubview(showChange)
        
        addSubview(marketCup)
        addSubview(supply)
        addSubview(volume)
        addSubview(column1)
        addSubview(column2)
        
        addSubview(marketCupData)
        addSubview(supplyData)
        addSubview(volumeData)
        
        bgImage.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        backButton.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(58)
            make.leading.equalToSuperview().offset(20)
            make.height.equalTo(40)
            make.width.equalTo(40)
        }
        
        titleLabel.snp.makeConstraints { make in
            make.centerY.equalTo(backButton.snp.centerY)
            make.leading.equalTo(backButton.snp.trailing).offset(16)
        }
        
        backImage.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.centerY.equalToSuperview()
            make.height.equalTo(20)
            make.width.equalTo(20)
        }
        
        cost.snp.makeConstraints { make in
            make.top.equalTo(backButton.snp.bottom).offset(32)
            make.leading.equalToSuperview().offset(20)
        }
        
        showChange.snp.makeConstraints { make in
            make.leading.equalTo(cost.snp.trailing).offset(10)
            make.centerY.equalTo(cost.snp.centerY)
        }
        
        marketCup.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(20)
            make.top.equalTo(cost.snp.bottom).offset(24)
        }
        
        column1.snp.makeConstraints { make in
            make.trailing.equalTo(supply.snp.leading).offset(-33)
            make.top.equalTo(cost.snp.bottom).offset(31.5)
            make.width.equalTo(1)
            make.height.equalTo(20)
        }
        
        supply.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.centerY.equalTo(marketCup.snp.centerY)
        }
        
        column2.snp.makeConstraints { make in
            make.leading.equalTo(supply.snp.trailing).offset(33)
            make.top.equalTo(cost.snp.bottom).offset(31.5)
            make.width.equalTo(1)
            make.height.equalTo(20)
        }
        
        volume.snp.makeConstraints { make in
            make.trailing.equalToSuperview().offset(-20)
            make.top.equalTo(cost.snp.bottom).offset(24)
        }
        
        marketCupData.snp.makeConstraints { make in
            make.leading.equalTo(marketCup.snp.leading)
            make.top.equalTo(marketCup.snp.bottom).offset(3)
        }
        
        supplyData.snp.makeConstraints { make in
            make.leading.equalTo(supply.snp.leading)
            make.top.equalTo(supply.snp.bottom).offset(3)
        }
        
        volumeData.snp.makeConstraints { make in
            make.leading.equalTo(volume.snp.leading)
            make.top.equalTo(volume.snp.bottom).offset(3)
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
