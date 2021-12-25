//
//  CharacterSearchViewController.swift
//  Marvel VIPER Example
//
//  Created by Carlos Henrique Gava on 24/12/21.
//

import Foundation
import UIKit

protocol CharacterSearchViewControllerProtocol: AnyObject {
    func show(heroes: [Character])
    func show(image: UIImage, for url: URL)
    func showStub()
}

class CharacterSearchViewController: SearchTemplateViewController, UITableViewDataSource {
    private var presenter: CharacterSearchPresenterProtocol
    private var charactersArray = [Character]()

    init(presenter: CharacterSearchPresenterProtocol) {
        self.presenter = presenter
        super.init(categoryName: "Heroes", reuseIdentifier: "characterCell")
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        presenter.loadCharacters(with: nil)
        super.viewDidLoad()

        tableView.dataSource = self
    }

    override func viewWillAppear(_ animated: Bool) {
        configureNavigationBar()
    }

    private func configureNavigationBar() {
        navigationController?.navigationBar.shadowImage = UIImage()
        navigationController?.navigationBar.barTintColor = UIColor(named: "HeaderTitleColor")
        navigationController?.navigationBar.isTranslucent = false
        navigationController?.navigationBar.isHidden = true
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return charactersArray.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .subtitle, reuseIdentifier: "cell")

        cell.accessoryType = .disclosureIndicator
        cell.imageView?.layer.masksToBounds = true
        cell.imageView?.layer.cornerRadius = 40

        if let name = charactersArray[indexPath.row].name, let details = charactersArray[indexPath.row].description, let url = charactersArray[indexPath.row].thumbnail?.url {
            cell.textLabel?.text = name
            cell.detailTextLabel?.text = details != "" ? details : "Sem detalhes do heroi"
            cell.detailTextLabel?.textColor = .systemGray
            cell.detailTextLabel?.font = .systemFont(ofSize: 14)

            if let imageForCrop = imagesDict[url] {
                let cropSide = min(imageForCrop.size.width, imageForCrop.size.height)
                if let newImage = imageForCrop.cgImage?.cropping(to: CGRect(x: 0, y: 0, width: cropSide, height: cropSide)) {
                    cell.imageView?.image = UIImage(cgImage: (newImage))
                }
            }
        }
        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let image = tableView.cellForRow(at: indexPath)?.imageView?.image
        presenter.showDetail(of: charactersArray[indexPath.row], with: image)
    }
}

extension CharacterSearchViewController: CharacterSearchViewControllerProtocol {
    func showStub() {
        dummy.isHidden = false
        charactersArray = []
        tableView.reloadData()
    }

    func show(image: UIImage, for url: URL) {
        imagesDict.updateValue(image, forKey: url)
        tableView.reloadData()
    }

    func show(heroes: [Character]) {
        charactersArray = heroes
        dummy.isHidden = true
        tableView.reloadData()
    }
}

extension CharacterSearchViewController {
    func textFieldDidEndEditing(_ textField: UITextField) {
        if let hero = textField.text {
            queryText = hero
            imagesDict.removeAll()
            presenter.loadCharacters(with: hero)
        } else {return}
    }
}
