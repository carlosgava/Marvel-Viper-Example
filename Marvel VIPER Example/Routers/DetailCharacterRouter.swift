//
//  DetailCharacterRouter.swift
//  Marvel VIPER Example
//
//  Created by Carlos Henrique Gava on 24/12/21.
//

import Foundation

protocol DetailCharacterRouterProtocol {}

class DetailCharacterRouter: DetailCharacterRouterProtocol {
    weak var viewController: DetailCharacterViewControllerProtocol?
    private var factory: Factory

    init(factory: Factory) {
        self.factory = factory
    }
}
