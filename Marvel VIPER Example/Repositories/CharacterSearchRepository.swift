//
//  CharacterSearchRepository.swift
//  Marvel VIPER Example
//
//  Created by Carlos Henrique Gava on 24/12/21.
//

import Foundation
protocol CharacterSearchRepositoryProtocol {
    func getCharacters(with nameParameter: String?, completion: @escaping (Result<Character, SearchError>) -> Void)
}

class CharacterSearchRepository: CharacterSearchRepositoryProtocol {
    private let apiClient = MarvelAPIClient(publicKey: AppConstants.publicKey, privateKey: AppConstants.privateKey)

    public func getCharacters(with nameParameter: String?, completion: @escaping (Result<Character, SearchError>) -> Void) {
        apiClient.send(GetCharacters(name: nil, nameStartsWith: nameParameter, limit: nil, offset: nil)) { response in
            _ = response.map { dataContainer in
                if dataContainer.results.isEmpty {
                    completion(.failure(.noMatches))
                }
                for character in dataContainer.results {
                        completion(.success(character))
                }
            }
        }
    }
}
