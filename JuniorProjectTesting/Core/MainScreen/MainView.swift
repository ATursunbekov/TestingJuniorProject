//
//  MainView.swift
//  JuniorProjectTesting
//
//  Created by Alikhan Tursunbekov on 24/1/24.
//

import UIKit
import SnapKit

class MainView: UIView {
    
    lazy var bgImage: UIImageView = {
        let image = UIImageView(image: UIImage(named: "bg"))
        image.contentMode = .scaleToFill
        return image
    }()
    
    lazy var refreshControl = {
        let refresh = UIRefreshControl()
        refresh.tintColor = .white
        return refresh
    }()
    
    lazy var searchBar: CustomSearchBar = CustomSearchBar()
    
    lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.rowHeight = 72
        tableView.separatorStyle = .none
        tableView.showsVerticalScrollIndicator = false
        tableView.register(CustomTableViewCell.self, forCellReuseIdentifier: CustomTableViewCell.identifier)
        tableView.layer.backgroundColor = UIColor.clear.cgColor
        tableView.backgroundColor = .clear
        tableView.contentInset = UIEdgeInsets(top: 20, left: 0, bottom: 0, right: 0)
        return tableView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupConstraints()
    }
    
    func setupConstraints() {
        addSubview(bgImage)
        addSubview(searchBar)
        addSubview(tableView)
        if #available(iOS 10.0, *) {
            tableView.refreshControl = refreshControl
        } else {
            tableView.addSubview(refreshControl)
        }
        
        bgImage.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        searchBar.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(58)
            make.leading.trailing.equalToSuperview().inset(20)
            make.height.equalTo(40)
        }
        
        tableView.snp.makeConstraints { make in
            make.top.equalTo(searchBar.snp.bottom)
            make.leading.trailing.equalToSuperview().inset(20)
            make.bottom.equalToSuperview()
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
