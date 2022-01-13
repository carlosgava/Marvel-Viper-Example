//
//  DetailCharacterViewController.swift
//  Marvel VIPER Example
//
//  Created by Carlos Henrique Gava on 24/12/21.
//

import Foundation
import UIKit

protocol DetailCharacterViewControllerProtocol: AnyObject { }

class DetailCharacterViewController: DetailTemplateViewController,
                                        DetailCharacterViewControllerProtocol,
                                        UITableViewDataSource {
    private let presenter: DetailCharacterPresenterProtocol
    private var comicItemsArray = [ComicsItem]()

    init(presenter: DetailCharacterPresenterProtocol) {
        self.presenter = presenter
        super.init()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self

        configureNavigationBar()
        loadData()
    }

    private func configureNavigationBar() {
        navigationController?.viewControllers.forEach({ (viewController) in
            viewController.navigationItem.backButtonTitle = "Heroi Selecionado"
        })
        navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        navigationController?.navigationBar.shadowImage = UIImage()
        navigationController?.navigationBar.isHidden = false
        navigationController?.navigationBar.isTranslucent = true
    }

    private func loadData() {
        textLabel.text = presenter.loadCharacterData().0.description
        titleLabel.text = presenter.loadCharacterData().0.name
        image.image = presenter.loadCharacterData().1
        if let array = presenter.loadCharacterData().0.comics?.items {
            comicItemsArray = array
        }
        tableView.reloadData()
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return comicItemsArray.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .subtitle, reuseIdentifier: "comicsItemCell")
        if !comicItemsArray.isEmpty {

            let name = comicItemsArray[indexPath.row].name

            cell.textLabel?.text = name
        }
        return cell
    }

    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return !comicItemsArray.isEmpty ? "Comics which feature this character" : ""
    }
}
