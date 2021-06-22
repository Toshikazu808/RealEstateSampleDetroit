//
//  CodableBundleExtension.swift
//  ScrollViewPractice
//
//  Created by Ryan Kanno on 6/4/21.
//

import UIKit

extension Bundle {
   func decode<T: Codable>(file: String, returnType: T.Type, completion: @escaping (Result<T, Error>) -> Void) {
      // Locate the JSON file
      guard let url = self.url(forResource: file, withExtension: nil) else {
         fatalError("Failed to locate \(file) in bundle")
      }
      guard let data = try? Data(contentsOf: url) else {
         fatalError("failed to load \(file) from bundle")
      }
      let decoder = JSONDecoder()
      do {
//         let json = try JSONSerialization.jsonObject(with: data, options: .mutableContainers)
//         print(json)
         let decodedData = try decoder.decode(T.self, from: data)
         completion(.success(decodedData))
      } catch let decodingErr {
         print(decodingErr)
         completion(.failure(decodingErr))
      }
   }
}

extension UIImageView {
   func load(urlString: String) {
      guard let url = URL(string: urlString) else { return }
      DispatchQueue.main.async { [weak self] in
         if let data = try? Data(contentsOf: url) {
            if let image = UIImage(data: data) {
               DispatchQueue.main.async {
                  self?.image = image
               }
            }
         }
      }
   }
}

extension StringProtocol {
   subscript(offset: Int) -> Character {
      self[index(startIndex, offsetBy: offset)]
   }
}
