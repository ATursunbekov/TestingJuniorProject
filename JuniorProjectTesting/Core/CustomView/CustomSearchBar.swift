//
//  CustomSearchBar.swift
//  JuniorProjectTesting
//
//  Created by Alikhan Tursunbekov on 24/1/24.
//

import UIKit
import SnapKit

class CustomSearchBar: UIView {
    
    lazy var labelTitle: UILabel = {
        let label = UILabel()
        label.text = "Trending Coins"
        label.font = UIFont(name: "SFProDisplay-Bold", size: 30)
        label.textColor = .white
        return label
    }()
    
    lazy var searchButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(systemName: "magnifyingglass"), for: .normal)
        button.layer.borderColor = UIColor(hex: "#FFFFFF", alpha: 0.1).cgColor
        button.layer.borderWidth = 1
        button.layer.cornerRadius = 12
        button.tintColor = .white
        return button
    }()
    
    lazy var searchView : UIView = {
        let view = UIView()
        view.layer.borderColor = UIColor(hex: "#FFFFFF", alpha: 0.2).cgColor
        view.layer.borderWidth = 1
        view.layer.cornerRadius = 12
        return view
    }()
    
    lazy var cancelButton: UIButton = {
        let button = UIButton()
        button.setTitle("Cancel", for: .normal)
        button.setTitleColor(UIColor(hex: "#FFFFFF", alpha: 0.5) ,for: .normal)
        button.titleLabel?.font = UIFont(name: "SFProDisplay-Regular", size: 16)
        return button
    }()
    
    lazy var searchImage: UIImageView = {
        let image = UIImageView(image: UIImage(systemName: "magnifyingglass"))
        image.contentMode = .scaleAspectFit
        image.tintColor = UIColor(hex: "#FFFFFF", alpha: 0.3)
        return image
    }()
    
    lazy var textField: UITextField = {
        let textField = UITextField()
        textField.placeholder = ""
        textField.font = UIFont(name: "SFProDisplay-Regular", size: 16)
        textField.textColor = .white
        textField.tintColor = .white
        textField.autocapitalizationType = .none
        return textField
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupConstraints()
        setupTargets()
    }
    
    func setupConstraints() {
        addSubview(labelTitle)
        addSubview(searchButton)
        addSubview(searchView)
        addSubview(cancelButton)
        searchView.addSubview(searchImage)
        searchView.addSubview(textField)
        
        labelTitle.snp.makeConstraints { make in
            make.leading.equalToSuperview()
            make.centerY.equalToSuperview()
        }
        
        searchButton.snp.makeConstraints { make in
            make.trailing.equalToSuperview()
            make.centerY.equalToSuperview()
            make.height.equalTo(40)
            make.width.equalTo(40)
        }
        
        cancelButton.snp.makeConstraints { make in
            make.trailing.equalToSuperview()
            make.centerY.equalToSuperview()
        }
        
        searchView.snp.makeConstraints { make in
            make.leading.top.bottom.equalToSuperview()
            make.trailing.equalTo(cancelButton.snp.leading).offset(-12)
        }
        
        searchImage.snp.makeConstraints { make in
            make.width.equalTo(22)
            make.height.equalTo(20)
            make.centerY.equalToSuperview()
            make.leading.equalToSuperview().offset(9)
        }
        
        textField.snp.makeConstraints { make in
            make.leading.equalTo(searchImage.snp.trailing).offset(8)
            make.centerY.equalToSuperview()
            make.trailing.equalToSuperview()
        }
        
        searchView.isHidden = true
        cancelButton.isHidden = true
    }
    
    func setupTargets() {
        searchButton.addTarget(self, action: #selector(searchPressed), for: .touchUpInside)
        cancelButton.addTarget(self, action: #selector(cancelPressed), for: .touchUpInside)
    }
    
    @objc func searchPressed() {
        print("Pressed")
        togglleUI()
    }
    
    @objc func cancelPressed() {
        togglleUI()
        textField.text = ""
    }
    
    func togglleUI() {
        labelTitle.isHidden.toggle()
        searchButton.isHidden.toggle()
        searchView.isHidden.toggle()
        cancelButton.isHidden.toggle()
    }
    
    func onChange() {}
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
