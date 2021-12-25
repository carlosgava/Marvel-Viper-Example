//
//  ResponseError.swift
//  Marvel VIPER Example
//
//  Created by Carlos Henrique Gava on 23/12/21.
//

import Foundation

enum ResponseError: Error {
    case encoding
    case decoding
    case server(message: String)
}
