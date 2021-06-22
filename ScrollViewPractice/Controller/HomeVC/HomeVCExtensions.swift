//
//  HomeVCExtensions.swift
//  ScrollViewPractice
//
//  Created by Ryan Kanno on 6/12/21.
//

import UIKit
import MapKit

extension HomeVC: UITableViewDelegate, UITableViewDataSource {
   func numberOfSections(in tableView: UITableView) -> Int {
      return 1
   }
   
   func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
      return 5
   }
   
   func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
      return tableView.frame.height / 5
   }
   
   func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
      if indexPath.row < displayProperties.count {
         let cell = tableView.dequeueReusableCell(withIdentifier: TableViewCell.name, for: indexPath) as! TableViewCell
         cell.configure(
            imageURL: displayProperties[indexPath.row].photos?[0].href ?? "",
            listPrice: displayProperties[indexPath.row].list_price,
            line: displayProperties[indexPath.row].location.address.line,
            city: displayProperties[indexPath.row].location.address.city,
            state: displayProperties[indexPath.row].location.address.state_code,
            postalCode: displayProperties[indexPath.row].location.address.postal_code,
            bed: displayProperties[indexPath.row].description.beds ?? 0,
            bath: displayProperties[indexPath.row].description.baths ?? 0,
            sqft: displayProperties[indexPath.row].description.sqft ?? 0,
            property: displayProperties[indexPath.row],
            rvr: displayProperties[indexPath.row].rvr ?? 0,
            rent: displayProperties[indexPath.row].rent ?? 0)
         cell.delegate = self
         return cell
      } else {
         let adCell = tableView.dequeueReusableCell(withIdentifier: AdCell.name, for: indexPath) as! AdCell
         return adCell
      }
   }
}


extension HomeVC: TableViewCellDelegate {
   func didTapZillow(url: String) {
      print(#function)
      UIApplication.shared.open(
         URL(string: url)! as URL,
         options: [:],
         completionHandler: nil)
   }
}


extension HomeVC: DataManagerDelegate {
   func setDefaultLocation() {
      DispatchQueue.main.async {
         let location = CLLocation(latitude: DataManager.lat, longitude: DataManager.long)
         LocationManager.shared.setLocationToDetroit(location: location, mapView: self.mapView)
      }
   }
}


extension HomeVC {
   func configureDropdownButtons() {
      filterButtons.forEach { button in
         button.layer.cornerRadius = 6
      }
      for i in 0..<dropdownArray.count {
         dropdownArray[i].layer.cornerRadius = 6
         dropdownArray[i].anchorView = filterButtons[i]
         dropdownArray[i].bottomOffset = CGPoint(x: 0, y: filterButtons[i].frame.size.height)
         dropdownArray[i].dataSource = K.dropDownDataSources[i]
      }
   }
   
   // dropdownIndices = [0. minButton, 1. maxButton, 2. rvButton, 3. filterButton]
   func configureMaxDropdownData() {
      switch dropdownIndices[0] {
      case 0:
         maxDropdown.dataSource = K.maxDataSource
      case K.minDataSource.count:
         maxDropdown.dataSource = ["None"]
         filterButtons[maxBtnIndx].setTitle("None", for: .normal)
      case _ where dropdownIndices[0] > dropdownIndices[1] && dropdownIndices[1] != 0:
         maxDropdownStartingIndex = dropdownIndices[0] + 1
         var newMaxDataSource = K.maxDataSource
         newMaxDataSource.removeSubrange(0..<maxDropdownStartingIndex)
         maxDropdown.dataSource = newMaxDataSource
         filterButtons[maxBtnIndx].setTitle(newMaxDataSource[0], for: .normal)
      default:
         break
      }
   }
   
   func completeUSPropertyModel(properties: [USRealEstatePropertyForSale]) -> [USRealEstatePropertyForSale] {
      var completedProperties = properties
      for i in 0..<completedProperties.count {
         var rent: Double = 0
         Bundle.main.decode(file: "RentEstimateAPI.json", returnType: RentEstimateModel.self) { result in
            switch result {
            case .failure(let error):
               print(error)
            case .success(let success):
               rent = success.rent
            }
         }
         completedProperties[i].rent = rent
         completedProperties[i].rvr = Calculator.shared.getRVR(listPrice: completedProperties[i].list_price, rent: completedProperties[i].rent ?? 0)
         completedProperties[i].listDateInt = format.listDateToInt(completedProperties[i].list_date)
      }
      return completedProperties
   }
   
   // dropdownIndices = [0. minButton, 1. maxButton, 2. rvButton, 3. filterButton]
   func applyFilters() {
      filterMinMax()
      filterMinRVR()
      filterOthers()
      if displayProperties.count > 0 {
         tableView.reloadData()
      } else {
         let noProperties = "There are no properties within that range."
         let alert = UIAlertController(title: "Error", message: noProperties, preferredStyle: .alert)
         alert.addAction(UIAlertAction(title: "Dismiss", style: .default, handler: nil))
         present(alert, animated: true)
      }
   }
   
   func filterMinMax() {
      if dropdownIndices[0] != 0 && dropdownIndices[1] != 0 {
         configureMaxDropdownData()
         let minPrice = format.dollarsToInt(dollarAmount: K.minDataSource[dropdownIndices[0]])
         let maxPrice = format.dollarsToInt(dollarAmount: K.maxDataSource[dropdownIndices[1]])
         displayProperties = (properties?.data.results.filter({$0.list_price > minPrice && $0.list_price < maxPrice}))!
      } else if dropdownIndices[0] == 0 && dropdownIndices[1] != 0 {
         let maxPrice = format.dollarsToInt(dollarAmount: K.maxDataSource[dropdownIndices[1]])
         displayProperties = (properties?.data.results.filter({$0.list_price < maxPrice}))!
      } else if dropdownIndices[0] != 0 && dropdownIndices[1] == 0 {
         let minPrice = format.dollarsToInt(dollarAmount: K.minDataSource[dropdownIndices[0]])
         displayProperties = (properties?.data.results.filter({$0.list_price > minPrice}))!
      } else if dropdownIndices[0] == 0 && dropdownIndices[1] == 0 {
         displayProperties = (properties?.data.results)!
      }
   }
   
   func filterMinRVR() {
      let minRvr = format.rvrToDouble(rvrString: K.rvDataSource[dropdownIndices[2]])
      displayProperties = displayProperties.filter({$0.rvr ?? 0 > minRvr})
   }
   
   func filterOthers() {
      switch K.filterDataSource[dropdownIndices[3]] {
      case K.filterDataSource[0]:
         displayProperties = displayProperties.sorted(by: {$0.listDateInt ?? 0 > $1.listDateInt ?? 0})
      case K.filterDataSource[1]:
         displayProperties = displayProperties.sorted(by: {$0.listDateInt ?? 0 < $1.listDateInt ?? 0})
      case K.filterDataSource[2]:
         displayProperties = displayProperties.sorted(by: {$0.description.sqft ?? 0 > $1.description.sqft ?? 0})
      case K.filterDataSource[3]:
         displayProperties = displayProperties.sorted(by: {$0.description.sqft ?? 0 < $1.description.sqft ?? 0})
      default:
         break
      }
   }
}
