//
//  ScrollViewPracticeTests.swift
//  ScrollViewPracticeTests
//
//  Created by Ryan Kanno on 6/7/21.
//

import XCTest
@testable import ScrollViewPractice

class ScrollViewPracticeCalculatorTests: XCTestCase {
   let calculator = Calculator()
   
   func testGetAnnualInsurance() {
      let annualInsurance1 = calculator.getAnnualInsurance(sqft: 3108)
      let annualInsurance2 = calculator.getAnnualInsurance(sqft: 2000)
      let annualInsurance3 = calculator.getAnnualInsurance(sqft: 1600)
      let annualInsurance4 = calculator.getAnnualInsurance(sqft: 0)
      let annualInsurance5 = calculator.getAnnualInsurance(sqft: 2150)
      XCTAssertEqual(annualInsurance1, 1740)
      XCTAssertEqual(annualInsurance2, 1120)
      XCTAssertEqual(annualInsurance3, 896)
      XCTAssertEqual(annualInsurance4, 0)
      XCTAssertEqual(annualInsurance5, 1204)
   }
   
   func testGetMonthlyNOI() {
      let noi1 = calculator.getMonthlyNOI(
         monthlyGrossRentalIncome: 3000,
         vacancyRateAsPercent: 0.05,
         propertyManagementAsPercent: 0.1,
         monthlyLeasingCostPerUnit: 400,
         numberOfUnits: 3,
         averageOccupancyYears: 1,
         maintenanceCostAsPercent: 0.05,
         monthlyUtilitiesAsDollars: 0,
         annualPropTaxesAsDollars: 2557,
         annualInsurance: 1740)
      let noi2 = calculator.getMonthlyNOI(
         monthlyGrossRentalIncome: 2000,
         vacancyRateAsPercent: 0.15,
         propertyManagementAsPercent: 0.12,
         monthlyLeasingCostPerUnit: 200,
         numberOfUnits: 4,
         averageOccupancyYears: 1,
         maintenanceCostAsPercent: 0.05,
         monthlyUtilitiesAsDollars: 0,
         annualPropTaxesAsDollars: 1500,
         annualInsurance: 896)
      let noi3 = calculator.getMonthlyNOI(
         monthlyGrossRentalIncome: 1000,
         vacancyRateAsPercent: 0.5,
         propertyManagementAsPercent: 0,
         monthlyLeasingCostPerUnit: 0,
         numberOfUnits: 4,
         averageOccupancyYears: 2,
         maintenanceCostAsPercent: 0.05,
         monthlyUtilitiesAsDollars: 100,
         annualPropTaxesAsDollars: 2000,
         annualInsurance: 896)
      let noi4 = calculator.getMonthlyNOI(
         monthlyGrossRentalIncome: 1500,
         vacancyRateAsPercent: 0,
         propertyManagementAsPercent: 0.1,
         monthlyLeasingCostPerUnit: 150,
         numberOfUnits: 1,
         averageOccupancyYears: 1,
         maintenanceCostAsPercent: 0.05,
         monthlyUtilitiesAsDollars: 120,
         annualPropTaxesAsDollars: 1234,
         annualInsurance: 364)
      XCTAssertEqual(noi1, 1957)
      XCTAssertEqual(noi2, 1130)
      XCTAssertEqual(noi3, 109)
      XCTAssertEqual(noi4, 1009)
   }
   
}
