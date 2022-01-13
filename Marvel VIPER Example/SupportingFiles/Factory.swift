//
//  Factory.swift
//  Marvel VIPER Example
//
//  Created by Carlos Henrique Gava on 23/12/21.
//

import Foundation
import UIKit

class Factory {
    func getSearchCharacter() -> UIViewController {
        let repository = CharacterSearchRepository()
        let router = CharacterSearchRouter(factory: self)
        let presenter = CharacterSearchPresenter(repository: repository, router: router)
        let viewController = CharacterSearchViewController(presenter: presenter)

        router.viewController = viewController
        presenter.view = viewController

        return viewController
    }

    func getCharacterFoundDetail(character: Character, image: UIImage?) -> DetailCharacterViewController {
        let repository = DetailCharacterRepository(character: character, image: image)
        let router = DetailCharacterRouter(factory: self)
        let presenter = DetailCharacterPresenter(repository: repository, router: router)
        let viewController = DetailCharacterViewController(presenter: presenter)

        router.viewController = viewController
        presenter.view = viewController

       return viewController
   }
}
