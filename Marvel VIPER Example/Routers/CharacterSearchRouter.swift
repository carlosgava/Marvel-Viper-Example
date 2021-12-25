//
//  CharacterSearchRouter.swift
//  Marvel VIPER Example
//
//  Created by Carlos Henrique Gava on 24/12/21.
//

import Foundation
import UIKit

protocol CharacterSearchRouterProtocol {
    func showDetail(of character: Character, with image: UIImage?)
}

class CharacterSearchRouter {
    weak var viewController: CharacterSearchViewController?
    private var factory: Factory
    init(factory: Factory) {
        self.factory = factory
    }
}

extension CharacterSearchRouter: CharacterSearchRouterProtocol {
    func showDetail(of character: Character, with image: UIImage?) {
        let detailViewController = factory.getCharacterFoundDetail(character: character, image: image)
        viewController?.navigationController?.pushViewController(detailViewController, animated: true)
    }
}
