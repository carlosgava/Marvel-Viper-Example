//
//  DetailCharacterRepository.swift
//  Marvel VIPER Example
//
//  Created by Carlos Henrique Gava on 24/12/21.
//

import Foundation
import UIKit

protocol DetailCharacterRepositoryProtocol {
    func getCharacterDetails() -> (Character, UIImage?)
}

class DetailCharacterRepository: DetailCharacterRepositoryProtocol {
    private var character: Character
    private var image: UIImage?

    init(character: Character, image: UIImage?) {
        self.character = character
        self.image = image
    }

    func getCharacterDetails() -> (Character, UIImage?) {
        return (character, image)
    }
}
