//
//  Calculate.swift
//  ScrollViewPractice
//
//  Created by Ryan Kanno on 6/6/21.
//

import Foundation

public class Calculator {
   static let shared = Calculator()
   
   func getAnnualInsurance(sqft: Int) -> Double {
      let pricePerSqft: Double = 0.56
      return (Double(sqft) * pricePerSqft).rounded()
   }
   
   func getMonthlyPayment(listPrice: Double, dwnPmtPercent: Double, intRate: Double, term: Int) -> Double {
      let convertedRate = intRate / 100
      let monthlyRate = convertedRate / 12
      let percentDown = dwnPmtPercent / 100
      let loan = listPrice * (1 - percentDown)
      
      let months = term * 12
      if convertedRate == 0 {
         return loan / Double(months)
      }
      
      let numerator = loan * (monthlyRate * pow(1 + monthlyRate, Double(months)))
      let denominator = pow(1 + monthlyRate, Double(months)) - 1
      
      return numerator / denominator
   }
   
   func getMonthlyNOI(
      monthlyGrossRentalIncome: Double,
      vacancyRateAsPercent: Double,
      propertyManagementAsPercent: Double,
      monthlyLeasingCostPerUnit: Double,
      numberOfUnits: Int,
      averageOccupancyYears: Int,
      maintenanceCostAsPercent: Double,
      monthlyUtilitiesAsDollars: Double,
      annualPropTaxesAsDollars: Double,
      annualInsurance: Double) -> Double {
      
      let averageVacancy = monthlyGrossRentalIncome * vacancyRateAsPercent
      let netRentalIncome = monthlyGrossRentalIncome - averageVacancy
      
      let propertyManagementAsDollars = netRentalIncome * propertyManagementAsPercent
      let leasingAsDollars = monthlyLeasingCostPerUnit * Double(numberOfUnits) / 12 / Double(averageOccupancyYears)
      let maintenanceAsDollars = monthlyGrossRentalIncome * maintenanceCostAsPercent
      
      let monthlyPropertyTaxesAsDollars = annualPropTaxesAsDollars / 12
      let monthlyInsuranceAsDollars = annualInsurance / 12
      
      let noiExpenses = propertyManagementAsDollars + leasingAsDollars + maintenanceAsDollars + monthlyUtilitiesAsDollars + monthlyPropertyTaxesAsDollars + monthlyInsuranceAsDollars
      
      return (netRentalIncome - noiExpenses).rounded()
   }
   
   func getRVR(listPrice: Int, rent: Double) -> Double {
      return (rent / Double(listPrice) * 100).rounded()
   }
   
}
