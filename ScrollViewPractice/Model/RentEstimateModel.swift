//
//  RentEstimateModel.swift
//  ScrollViewPractice
//
//  Created by Ryan Kanno on 6/6/21.
//

import Foundation

struct RentEstimateModel: Codable {
   let rent: Double
   let rentRangeLow: Double
   let rentRangeHigh: Double
   let longitude: Double
   let latitude: Double
   let listings: [RentEstimateListings]
}

struct RentEstimateListings: Codable {
   let id: String
   let formattedAddress: String
   let longitude: Double
   let latitude: Double
   let city: String
   let state: String
   let zipcode: String
   let price: Int
   let publishedDate: String
   let distance: Double
   let daysOld: Double
   let correlation: Double
   let address: String
   let county: String
   let bedrooms: Int
   let bathrooms: Int
   let propertyType: String
   let squareFootage: Int
}
