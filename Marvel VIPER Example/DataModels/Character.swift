//
//  Character.swift
//  Marvel VIPER Example
//
//  Created by Carlos Henrique Gava on 23/12/21.
//

import Foundation

struct Character: Decodable {
    let id: Int
    let name: String?
    let description: String?
    let thumbnail: Image?
    let comics: Comics?
}
