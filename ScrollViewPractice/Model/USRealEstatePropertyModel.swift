//
//  USRealEstatePropertyModel.swift
//  ScrollViewPractice
//
//  Created by Ryan Kanno on 6/3/21.
//

import Foundation

struct USRealEstatePropertyModel: Codable {
   let status: Int
   let data: USRealEstatePropertyData
}

struct USRealEstatePropertyData: Codable {
   let total: Int
   let count: Int
   let results: [USRealEstatePropertyForSale]
}

struct USRealEstatePropertyForSale: Codable {
   let primary_photo: USRealEstatePropertyPrimaryPhoto?
   let last_update_date: String
   let permalink: String
   let status: String
   let list_date: String
   let description: USRealEstatePropertyDescription
   let list_price: Int
   let property_id: String
   let photos: [USRealEstatePropertyPhotos]?
   let listing_id: String
   let price_reduced_amount: Int?
   let location: USRealEstatePropertyLocation
   var rent: Double?
   var rvr: Double?
   var listDateInt: Int?
}

struct USRealEstatePropertyPrimaryPhoto: Codable {
   let href: String?
}

struct USRealEstatePropertyDescription: Codable {
   let year_built: Int?
   let baths_full: Int?
   let baths_half: Int?
   let lot_sqft: Int?
   let sqft: Int?
   let baths: Int?
   let sub_type: String?
   let garage: Int?
   let stories: Int?
   let beds: Int?
   let type: String
}

struct USRealEstatePropertyPhotos: Codable {
   let tags: [USRealEstatePropertyPhotosTags]?
   let href: String
}

struct USRealEstatePropertyPhotosTags: Codable {
   let label: String?
   let probability: Double?
}

struct USRealEstatePropertyLocation: Codable {
   let address: USRealEstatePropertyLocationAddress
   let street_view_url: String
   let county: USRealEstatePropertyLocationCounty?
}

struct USRealEstatePropertyLocationAddress: Codable {
   let postal_code: String
   let state: String
   let coordinate: USRealEstatePropertyCoordinate?
   let city: String
   let state_code: String
   let line: String
}

struct USRealEstatePropertyCoordinate: Codable {
   let lon: Double?
   let lat: Double?
}

struct USRealEstatePropertyLocationCounty: Codable {
   let fips_code: String?
   let name: String?
}
