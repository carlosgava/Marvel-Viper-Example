//
//  DetailCharacterPresenter.swift
//  Marvel VIPER Example
//
//  Created by Carlos Henrique Gava on 24/12/21.
//

import Foundation
import UIKit

protocol DetailCharacterPresenterProtocol {
    func loadCharacterData() -> (Character, UIImage?)
}

class DetailCharacterPresenter: DetailCharacterPresenterProtocol {
    weak var view: DetailCharacterViewControllerProtocol? // weak
    private var router: DetailCharacterRouterProtocol // strong
    private var repository: DetailCharacterRepository // strong

    init(repository: DetailCharacterRepository, router: DetailCharacterRouterProtocol) {
        self.router = router
        self.repository = repository
    }

    func loadCharacterData() -> (Character, UIImage?) {
        return repository.getCharacterDetails()
    }
}
