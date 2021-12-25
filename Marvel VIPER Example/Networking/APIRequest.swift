//
//  APIRequest.swift
//  Marvel VIPER Example
//
//  Created by Carlos Henrique Gava on 23/12/21.
//

import Foundation

protocol APIRequest: Encodable {
    associatedtype Response: Decodable
    var resourceName: String { get }
}

enum SearchError: Error {
    case noMatches
}
