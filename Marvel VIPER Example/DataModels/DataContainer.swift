//
//  DataContainer.swift
//  Marvel VIPER Example
//
//  Created by Carlos Henrique Gava on 23/12/21.
//

import Foundation

struct DataContainer<Results: Decodable>:Decodable {
    let offset: Int
    let limit: Int
    let total: Int
    let count: Int
    let results: Results
}
