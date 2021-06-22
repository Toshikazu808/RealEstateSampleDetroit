//
//  Format.swift
//  ScrollViewPractice
//
//  Created by Ryan Kanno on 6/7/21.
//

import Foundation

struct Format {
   func rentEstimateURL(_ addressLine: String, _ city: String, _ stateCode: String) -> String {
      let address = checkForSpaceForURL(addressLine)
      let city = checkForSpaceForURL(city)
      return "\(address)%2C%20\(city)%2C%20\(stateCode)"
   }
   
   private func checkForSpaceForURL(_ item: String) -> String {
      var addressPart: String = ""
      for char in item {
         if char == " " {
            addressPart.append("%20")
         } else {
            addressPart.append(char)
         }
      }
      return addressPart
   }
   
   func dollarString(_ dollarAmount: String) -> String {
      let reversedAmount = dollarAmount.reversed()
      var dollarString: String = ""
      var count: Int = 0
      for num in reversedAmount {
         if count < 3 {
            dollarString += "\(num)"
            count += 1
         } else {
            dollarString += ",\(num)"
            count = 1
         }
      }
      return "$\(String(dollarString.reversed()))"
   }
   
   func numberString(_ number: String) -> String {
      let reversedNum = number.reversed()
      var numString: String = ""
      var count: Int = 0
      for num in reversedNum {
         if count < 3 {
            numString += "\(num)"
            count += 1
         } else {
            numString += ",\(num)"
            count = 1
         }
      }
      return String(numString.reversed())
   }
   
   func getZillowHomesURL(_ addressLine: String, _ city: String, _ state: String, _ zip: String) -> String {
      let line = addressLine.replacingOccurrences(of: " ", with: "-")
      let city = city.replacingOccurrences(of: " ", with: "-")
      return "\(URLs.zillowHomesURL)\(line)-\(city)-\(state)-\(zip)_rb/"
   }
   
   func dollarsToInt(dollarAmount: String) -> Int {
      var amount: String = dollarAmount
      let chars: Set<Character> = ["$", ","]
      amount.removeAll(where: {chars.contains($0)} )
      return Int(amount) ?? 0
   }
   
   func rvrToDouble(rvrString: String) -> Double {
      var rvr: String = rvrString
      let chars: Set<Character> = ["%", "+"]
      rvr.removeAll(where: {chars.contains($0)})
      return Double(rvr) ?? 0
   }
   
   func listDateToInt(_ listDate: String) -> Int {
      var trimmedDate: String = ""
      let trimToIndex = 9
      for i in 0...trimToIndex {
         let char = String(listDate[i])
         trimmedDate.append(char)
      }
      let dash: Set<Character> = ["-"]
      trimmedDate.removeAll(where: {dash.contains($0)})
      return Int(trimmedDate) ?? 0
   }
   
}
