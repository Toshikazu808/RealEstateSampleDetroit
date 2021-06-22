//
//  Helper.swift
//  ScrollViewPractice
//
//  Created by Ryan Kanno on 6/6/21.
//

import Foundation

struct APIHelper {
   func performCallNoHeaders<T: Codable>(urlString: String, returnType: T.Type, completion: @escaping (Result<T, Error>) -> Void) {
      print("\n\(#function)")
      if let url = URL(string: urlString) {
         let session = URLSession(configuration: .default)
         let task = session.dataTask(with: url) { (data, response, error) in
            let httpResponse = response as? HTTPURLResponse
            print(httpResponse as Any)
            if let error = error {
               completion(.failure(error))
               return
            } else {
               let httpResponse = response as? HTTPURLResponse
               print(httpResponse as Any)
            }
            guard let data = data else { return }
            let decoder = JSONDecoder()
            do {
               let json = try JSONSerialization.jsonObject(with: data, options: .mutableContainers)
               print(json)
               let decodedData = try decoder.decode(T.self, from: data)
               completion(.success(decodedData))
            } catch let decodingErr {
               completion(.failure(decodingErr))
            }
         }
         task.resume()
      } else {
         print("something went wrong with the url")
      }
   }
   
   func performCallWithHeaders<T: Codable>(url: String, headers: [String:String], expectingReturnType: T.Type, completion: @escaping (Result<T, Error>) -> Void ) {
      
      let request = NSMutableURLRequest(
         url: NSURL(string: url)! as URL,
         cachePolicy: .useProtocolCachePolicy,
         timeoutInterval: 10.0)
      request.httpMethod = "GET"
      request.allHTTPHeaderFields = headers
      
      let task = URLSession.shared.dataTask(
         with: request as URLRequest) { (data, response, error) in
         if let error = error {
            completion(.failure(error))
            return
         } else {
            let httpResponse = response as? HTTPURLResponse
            print(httpResponse as Any)
         }
         guard let data = data else { return }
         do {
            let json = try JSONSerialization.jsonObject(
               with: data, options: .mutableContainers)
            print(json)
            let decodedData = try JSONDecoder().decode(T.self, from: data)
            completion(.success(decodedData))
         } catch let decodingErr {
            completion(.failure(decodingErr))
         }
      }
      task.resume()
   }
}
