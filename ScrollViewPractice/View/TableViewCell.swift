//
//  TableViewCell.swift
//  ScrollViewPractice
//
//  Created by Ryan Kanno on 6/1/21.
//

import UIKit

protocol TableViewCellDelegate: AnyObject {
   func didTapZillow(url: String)
}

class TableViewCell: UITableViewCell {
   weak var delegate: TableViewCellDelegate?
   let format = Format()
   static let name = "TableViewCell"
   @IBOutlet weak var houseImage: UIImageView!
   @IBOutlet weak var priceLabel: UILabel!
   @IBOutlet weak var addressLabel: UILabel!
   @IBOutlet weak var bedLabel: UILabel!
   @IBOutlet weak var bathLabel: UILabel!
   @IBOutlet weak var sqftLabel: UILabel!
   @IBOutlet weak var rvrLabel: UILabel!
   @IBOutlet weak var noiLabel: UILabel!
   @IBOutlet weak var zillowButton: UIButton!
   @IBOutlet weak var favoriteButton: UIButton!
   // Normally we'd do an API call to get rent estimate for each cell
   private var zillowURL: String = ""
   
   override func awakeFromNib() {
      super.awakeFromNib()
      houseImage.layer.cornerRadius = 5
      zillowButton.layer.cornerRadius = 5
   }
   
   func configure(imageURL: String, listPrice: Int, line: String, city: String, state: String, postalCode: String, bed: Int, bath: Int, sqft: Int, property: USRealEstatePropertyForSale, rvr: Double, rent: Double) {
      self.zillowURL = format.getZillowHomesURL(line, city, state, postalCode)
      
      houseImage.load(urlString: imageURL)
      priceLabel.text = "\(format.dollarString(String(listPrice)))"
      addressLabel.text = "\(line), \(city), \(state) \(postalCode)"
      bedLabel.text = "\(bed) bed"
      bathLabel.text = "\(bath) bath"
      sqftLabel.text = "\(format.numberString(String(sqft))) sqft."
      rvrLabel.text = "RVR: \(rvr)%"
      let monthlyNOI: Double = Calculator.shared.getMonthlyNOI(
         monthlyGrossRentalIncome: rent,
         vacancyRateAsPercent: 0.05,
         propertyManagementAsPercent: 0.1,
         monthlyLeasingCostPerUnit: 400.0,
         numberOfUnits: property.description.beds ?? 0,
         averageOccupancyYears: 1,
         maintenanceCostAsPercent: 0.05,
         monthlyUtilitiesAsDollars: 0,
         annualPropTaxesAsDollars: 2557,
         annualInsurance: 0.56 * Double(property.description.lot_sqft ?? 0))
      noiLabel.text = "NOI: \(format.dollarString(String(monthlyNOI)))"
   }
   
   @IBAction func zillowButtonTapped(_ sender: UIButton) {
      delegate?.didTapZillow(url: zillowURL)
   }
   
}
