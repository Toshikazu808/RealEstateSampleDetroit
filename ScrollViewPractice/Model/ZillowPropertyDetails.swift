//
//  ZillowPropertyDetails.swift
//  ScrollViewPractice
//
//  Created by Ryan Kanno on 6/3/21.
//

import Foundation

struct ZillowPropertyDetails {
   let address: ZillowPropertyDetailsAddress
   let bathrooms: Int
   let bedrooms: Int
   let brokerId: Int
   let brokerageName: String
   let city: String
   let cityId: Int
   let contact_recipients: ZillowPropertyDetailsContactRecipients
   let country: String
   let county: String
   let countyId: Int
   let currency: String
   let datePosted: Int
   let description: String
   let favoriteCount: Int
   let hoaFee: Int
   let homeFacts: ZillowPropertyDetailsHomeFacts
   let homeStatus: String
   let homeType: String
   let isListedByOwner: Bool
   let latitude: Double
   let longitude: Double
   let listingProvider: ZillowPropertyDetailsListingProvider
   let livingArea: Int
   let livingAreaUnits: String
   let livingAreaValue: Int
   let mortgageRates: ZillowPropertyDetailsMortgageRates
   let pageViewCount: Int
   let price: Int
   let priceHistory: ZillowPropertyDetailsPriceHistory
   let propertyTaxRate: Double
   let propertyTypeDimension: String
   let providerListingID: String
   let schools: ZillowPropertyDetailsSchools
   let state: String
   let stateId: Int
   let streetAddress: String
   let timeOnZillow: String
   let timeZone: String
   let yearBuilt: Int
   let zestimate: Int
   let zestimateHighPercent: String
   let zestimateLowPercent: String
   let zipcode: String
   let zpid: Int
}

struct ZillowPropertyDetailsAddress {
   let city: String
   let state: String
   let streetAddress: String
   let zipcode: String
}

struct ZillowPropertyDetailsContactRecipients {
   let agent_reason: Int
   let badge_type: String
   let display_name: String
   let image_url: String
   let phone: ZillowPropertyDetailsContactRecipientsPhone
   let rating_average: Int
   let recent_sales: Int
   let review_count: Int
   let zpro: Bool
   let zuid: String
}

struct ZillowPropertyDetailsContactRecipientsPhone {
   let areacode: String
   let number: String
   let prefix: String
}

struct ZillowPropertyDetailsHomeFacts {
   let atAGlanceFacts: ZillowPropertyDetailsHomeFactsAtAGlanceFacts
   let categoryDetails: ZillowPropertyDetailsHomeFactsCategoryDetails
}

struct ZillowPropertyDetailsHomeFactsAtAGlanceFacts {
   let factLabel: String
   let factValue: String
}

struct ZillowPropertyDetailsHomeFactsCategoryDetails {
   let categoryGroupName: String
   let categories: ZillowPropertyDetailsHomeFactsCategoryDetailsCategories
}

struct ZillowPropertyDetailsHomeFactsCategoryDetailsCategories {
   let categoryName: String
   let categoryFacts: ZillowPropertyDetailsHomeFactsCategoryDetailsCategoriesFacts
}

struct ZillowPropertyDetailsHomeFactsCategoryDetailsCategoriesFacts {
   let factLabel: String
   let factValue: String
}

struct ZillowPropertyDetailsListingProvider {
   let agentName: String
   let disclaimerText: String
   let phoneNumber: String
   let postingGroupName: String
   let postingWebsiteLinkText: String
}

struct ZillowPropertyDetailsMortgageRates {
   let arm5Rate: Double
   let fifteenYearFixedRate: Double
   let thirtyYearFixedRate: Double
}

struct ZillowPropertyDetailsPriceHistory {
   let event: String
   let postingIsRental: Bool
   let price: Int
   let priceChangeRate: Double
   let source: String
   let time: Double
}

struct ZillowPropertyDetailsSchools {
   let distance: Double
   let grades: String
   let isAssigned: Bool
   let level: String
   let link: String
   let name: String
   let rating: Int
   let size: Int
   let studentsPerTeacher: Int
   let totalCount: Int
   let type: String
}
