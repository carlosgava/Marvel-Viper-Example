//
//  ResponseData.swift
//  Marvel VIPER Example
//
//  Created by Carlos Henrique Gava on 23/12/21.
//

import Foundation

struct ResponseData<Response: Decodable>: Decodable {
    let code: Int
    let status: String?
    let data: DataContainer<Response>?
}
