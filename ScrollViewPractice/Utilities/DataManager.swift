//
//  DataManager.swift
//  ScrollViewPractice
//
//  Created by Ryan Kanno on 6/8/21.
//

import Foundation

protocol DataManagerDelegate {
   func setDefaultLocation()
}

struct DataManager {
   var delegate: DataManagerDelegate?
   let apiHelper = APIHelper()
   static var lat: Double = 0
   static var long: Double = 0
   
   func setDefaultLocation() {
      print("\n\(#function)")
      let defaultLocation: String = "5200 Woodward Ave, Detroit, MI 48202"
      let mapQuestAddress = scanToMapQuest(defaultLocation)
      let mapQuestURL = "\(URLs.mapQuestURLFirstHalf)\(URLs.mapQuestKey)\(URLs.mapQuestURLAfterKey)\(mapQuestAddress)\(URLs.mapQuestURLAfterLocation)"
      getMapQuestCoordinates(url: mapQuestURL)
      delegate?.setDefaultLocation()
   }
   
   private func scanToMapQuest(_ addressString: String) -> String {
      var addressURL: String = addressString
      var count = 0
      for char in addressURL {
         switch char {
         case ",":
            let strIndex = addressURL.index(addressURL.startIndex, offsetBy: count)
            addressURL.remove(at: strIndex)
            addressURL.insert(contentsOf: "%2C", at: strIndex)
            count += 2
            break
         case " ":
            let strIndex = addressURL.index(addressURL.startIndex, offsetBy: count)
            addressURL.remove(at: strIndex)
            addressURL.insert(contentsOf: "+", at: strIndex)
            break
         case "#":
            let strIndex = addressURL.index(addressURL.startIndex, offsetBy: count)
            addressURL.remove(at: strIndex)
            addressURL.insert(contentsOf: "%23", at: strIndex)
            count += 2
            break
         default:
            break
         }
         count += 1
      }
      return addressURL
   }
   
   private func getMapQuestCoordinates(url: String) -> Void {
      apiHelper.performCallNoHeaders(urlString: url, returnType: MapQuestModel.self) { result in
         switch result {
         case .failure(let error):
            print(error)
         case .success(let success):
            DataManager.lat = success.results[0].locations[0].displayLatLng.lat
            DataManager.long = success.results[0].locations[0].displayLatLng.lng
         }
      }
   }
   
}
