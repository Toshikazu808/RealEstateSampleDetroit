//
//  K.swift
//  ScrollViewPractice
//
//  Created by Ryan Kanno on 6/6/21.
//

import Foundation

struct K {
   static let minDataSource: [String] = [
      "None", "$100,000", "$200,000",
      "$300,000", "$400,000", "$500,000",
      "$600,000", "$700,000", "$800,000",
      "$900,000", "$1,000,000", "$1,100,000",
      "$1,200,000", "$1,300,000", "$1,400,000",
      "$1,500,000"]
   static let maxDataSource: [String] = [
      "None", "$100,000", "$200,000",
      "$300,000", "$400,000", "$500,000",
      "$600,000", "$700,000", "$800,000",
      "$900,000", "$1,000,000", "$1,100,000",
      "$1,200,000", "$1,300,000", "$1,400,000",
      "$1,500,000"]
   static let rvDataSource: [String] = [
      "0.1%+", "0.2%+", "0.3%+", "0.4%+",
      "0.5%+", "0.6%+", "0.7%+", "0.8%+",
      "0.9%+", "1.0%+", "1.1%+", "1.2%+",
      "1.3%+", "1.4%+", "1.5%+", "1.6%+",
      "1.7%+", "1.8%+", "1.9%+", "2.0%+"]
   static let filterDataSource: [String] = ["Newest", "Oldest", "> sqft", "< sqft"]
   static let pageDataSource: [String] = ["1"]
   
   static let dropDownDataSources = [minDataSource, maxDataSource, rvDataSource, filterDataSource, pageDataSource]
}
