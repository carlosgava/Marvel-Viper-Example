//
//  Creator.swift
//  Marvel VIPER Example
//
//  Created by Carlos Henrique Gava on 24/12/21.
//

import Foundation

struct Creator: Decodable {
    let id: Int
    let fullName: String?
    let thumbnail: Image?
    let comics: Comics?
}
