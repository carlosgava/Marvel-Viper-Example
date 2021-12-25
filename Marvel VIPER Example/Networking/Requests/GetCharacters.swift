//
//  GetCharacters.swift
//  Marvel VIPER Example
//
//  Created by Carlos Henrique Gava on 23/12/21.
//

import Foundation

struct GetCharacters: APIRequest {
    typealias Response = [Character]
    var resourceName: String {
        return "characters"
    }

    let name: String?
    let nameStartsWith: String?
    let limit: Int?
    let offset: Int?

    init(
        name: String? = nil,
        nameStartsWith: String? = nil,
        limit: Int? = nil,
        offset: Int? = nil
    ) {
        self.name = name
        self.nameStartsWith = nameStartsWith
        self.limit = limit
        self.offset = offset
    }
}
