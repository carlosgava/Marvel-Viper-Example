//
//  SearchTemplateViewController.swift
//  Marvel VIPER Example
//
//  Created by Carlos Henrique Gava on 23/12/21.
//

import Foundation
import UIKit

class SearchTemplateViewController: UIViewController, UITableViewDelegate, UISearchBarDelegate {
    var imagesDict = [URL : UIImage]()
    let tableView = UITableView()
    private var titleBar = TitleBarView(frame: .zero)
    
    var reuseIdentifier: String?
    var categoryName: String?
    
    var queryText: String = "" {
        didSet {
            dummy.label.text = "Nenhuma correspondência para a consulta \"" + queryText + "\""
        }
    }
    var dummy = EmptyView(frame: .zero, queryText: "")
    
    init(categoryName: String?, reuseIdentifier: String?) {
        super.init(nibName: nil, bundle: nil)
        self.categoryName = categoryName
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        if #available(iOS 13.0, *) {
            self.titleBar.searchBar.searchTextField.delegate = self
        } else {
            self.titleBar.searchBar.delegate = self
        }
        setupTitleView()
        setupTableView()
        registerCells()
        setTableViewHeights()
        setUpDummyView()
    }
    
    private func setupTitleView() {
        view.addSubview(titleBar)
        titleBar.title.text = categoryName?.uppercased()
        titleBar.translatesAutoresizingMaskIntoConstraints = false
        titleBar.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        titleBar.heightAnchor.constraint(equalToConstant: 140).isActive = true
        titleBar.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor).isActive = true
        titleBar.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor).isActive = true
    }
    
    private func setupTableView() {
        view.addSubview(tableView)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.topAnchor.constraint(equalTo: titleBar.bottomAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor).isActive = true
        tableView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor).isActive = true
        tableView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor).isActive = true
    }
    
    private func setUpDummyView() {
        let bottomConstant = tabBarController?.tabBar.frame.height
        view.addSubview(dummy)
        dummy.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 120).isActive = true
        dummy.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: bottomConstant ?? 0).isActive = true
        dummy.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor).isActive = true
        dummy.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor).isActive = true
        dummy.isHidden = true
        dummy.translatesAutoresizingMaskIntoConstraints = false
    }
    
    private func setTableViewHeights() {
        tableView.rowHeight = UITableView.automaticDimension
    }
    
    private func registerCells() {
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: reuseIdentifier ?? "cell")
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
}

extension SearchTemplateViewController: UISearchTextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.endEditing(true)
        return true
    }

    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
        if textField.text != "" {
            return true
        } else {
            return false
        }
    }
}

