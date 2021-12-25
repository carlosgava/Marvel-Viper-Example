//
//  Characters.swift
//  Marvel VIPER Example
//
//  Created by Carlos Henrique Gava on 24/12/21.
//

import Foundation

struct Characters: Codable {
    let available: Int
    let collectionURI: String
    let items: [CharacterList]
    let returned: Int
}

struct CharacterList: Codable {
    let resourceURI: String
    let name: String
}
