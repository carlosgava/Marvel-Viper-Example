//
//  Comic.swift
//  Marvel VIPER Example
//
//  Created by Carlos Henrique Gava on 24/12/21.
//

import Foundation
struct Comic: Decodable {
    let id: Int
    let title: String?
    let issueNumber: Double?
    let description: String?
    let pageCount: Int?
    let thumbnail: Image?
    let characters: Characters?
}
