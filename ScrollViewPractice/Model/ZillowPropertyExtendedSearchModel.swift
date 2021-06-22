//
//  ZillowPropertyExtendedSearch.swift
//  ScrollViewPractice
//
//  Created by Ryan Kanno on 6/3/21.
//

import Foundation

struct ZillowPropertyExtendedSearchModel: Codable {
   let resultsPerPage: Int
   let totalResultCount: Int
   let totalPages: Int
   let props: ZillowPropertyExtendedSearchProps
}

struct ZillowPropertyExtendedSearchProps: Codable {
   let bathrooms: Int
   let listingDateTime: Int
   let propertyType: String
   let latitude: Double
   let price: Int
   let listingStatus: String
   let zpid: Int
   let longitude: Double
   let livingArea: Int
   let address: String
   let bedrooms: Int
   let imgSrc: String // this is a url
   let country: String
   let currency: String
   let daysOnZillow: Int
   let hasImage: Bool
}
