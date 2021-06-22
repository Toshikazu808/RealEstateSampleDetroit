//
//  MapQuestModel.swift
//  ScrollViewPractice
//
//  Created by Ryan Kanno on 6/8/21.
//

import Foundation

struct MapQuestModel: Codable {
   let results: [Results]
}
struct Results: Codable {
   let locations: [Locations]
}
struct Locations: Codable {
   let displayLatLng: DisplayLatLng
}
struct DisplayLatLng: Codable {
   let lat: Double
   let lng: Double
}
