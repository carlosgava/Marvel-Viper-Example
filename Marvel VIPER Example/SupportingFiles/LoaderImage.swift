//
//  LoaderImage.swift
//  Marvel VIPER Example
//
//  Created by Carlos Henrique Gava on 23/12/21.
//

import Foundation
import UIKit

protocol LoaderImageProtocol {
    func loadImage(_ url: URL, _ completion: @escaping (Result<UIImage, Error>) -> Void) -> UUID?
    func cancelLoad(_ uuid: UUID)
}

class LoaderImage: LoaderImageProtocol {
    private var loadedImages = [URL: UIImage]()
    private var runningRequests = [UUID: URLSessionDataTask]()
    static let loader = LoaderImage()

    func loadImage(_ url: URL, _ completion: @escaping (Result<UIImage, Error>) -> Void) -> UUID? {
      if let image = loadedImages[url] {
        completion(.success(image))
        return nil
      }

      let uuid = UUID()

      let task = URLSession.shared.dataTask(with: url) { data, response, error in
        defer {self.runningRequests.removeValue(forKey: uuid) }

        if let data = data, let image = UIImage(data: data) {
          self.loadedImages[url] = image
          completion(.success(image))
          return
        }

        guard let error = error else {
            print("LoaderImage: \(String(describing: error))")
            return
        }

        guard (error as NSError).code == NSURLErrorCancelled else {
            print("LoaderImage: \(error)")
            completion(.failure(error))
            return
        }
      }
      task.resume()

      runningRequests[uuid] = task
      return uuid
    }

    func cancelLoad(_ uuid: UUID) {
      runningRequests[uuid]?.cancel()
      runningRequests.removeValue(forKey: uuid)
    }
}
