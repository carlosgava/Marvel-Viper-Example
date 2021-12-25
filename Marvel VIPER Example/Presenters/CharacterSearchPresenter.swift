//
//  CharacterSearchPresenter.swift
//  Marvel VIPER Example
//
//  Created by Carlos Henrique Gava on 24/12/21.
//

import Foundation
import UIKit

protocol CharacterSearchPresenterProtocol {
    func showDetail(of character: Character, with image: UIImage?)
    func loadCharacters(with nameParameter: String?)
}

class CharacterSearchPresenter {
    private var repository: CharacterSearchRepositoryProtocol //strong
    private var router: CharacterSearchRouterProtocol //strong
    weak var view: CharacterSearchViewControllerProtocol? //weak
    private var loader = LoaderImage()

    private var imagesUrls = [URL]()

    init(repository: CharacterSearchRepositoryProtocol, router: CharacterSearchRouterProtocol) {
        self.repository = repository
        self.router = router
    }

    private func loadImages() {
        if let newUrl = imagesUrls.popLast() {
            let _ = loader.loadImage(newUrl) { result in
                do {
                    let image = try result.get()
                    DispatchQueue.main.async {
                        self.view?.show(image: image, for: newUrl)
                    }
                } catch {
                    print(error)
                }
            }
        }
    }
}

extension CharacterSearchPresenter: CharacterSearchPresenterProtocol {
    func loadCharacters(with nameParameter: String?) {
        var charactersArray = [Character]()
        imagesUrls = []
        repository.getCharacters(with: nameParameter) { result in

            let token = result.map({ comicCharacter in
                DispatchQueue.main.async {
                    if let newUrl = comicCharacter.thumbnail?.url {
                        self.imagesUrls.append(newUrl)
                        self.loadImages()
                    }
                    charactersArray.append(comicCharacter)
                    self.view?.show(heroes: charactersArray)
                }
            })
            do {
                try token.get()
            } catch {
                print(error)
                DispatchQueue.main.async {
                    self.view?.showStub()
                }
            }
        }
    }

    func showDetail(of character: Character, with image: UIImage?) {
        router.showDetail(of: character, with: image)
    }
}
