//
//  ViewController.swift
//  ScrollViewPractice
//
//  Created by Ryan Kanno on 6/1/21.
//

import UIKit
import MapKit
import DropDown

class HomeVC: UIViewController {
   let api = APIHelper()
   let urls = URLs()
   @IBOutlet weak var titleLabel: UILabel!
   @IBOutlet weak var subTitleLabel: UILabel!
   
   @IBOutlet weak var mapView: MKMapView!
   @IBOutlet weak var adView: UIView!
   @IBOutlet weak var adViewLabel: UILabel!
   
   @IBOutlet weak var buttonGroupView: UIView!
   @IBOutlet weak var buttonGroupTitleLabel: UILabel!
   
   // [minButton, maxButton, rvButton, filterButton, pageJump]
   @IBOutlet var filterButtons: [UIButton]!
   let maxBtnIndx: Int = 1
   var dropdownIndices: [Int] = [0, 0, 0, 0] // doesn't contain pageJump
   
   let minDropdown = DropDown()
   let maxDropdown = DropDown()
   var maxDropdownStartingIndex = 0
   let rvDropdown = DropDown()
   let filterDropdown = DropDown()
   let pageDropdown = DropDown()
   var pageDropdownIndex: Int = 0
   
   var dropdownArray: [DropDown] = []
   
   @IBOutlet weak var tableView: UITableView!
   
   @IBOutlet weak var farLeftPageButton: UIButton!
   @IBOutlet weak var leftPageButton: UIButton!
   @IBOutlet weak var rightPageButton: UIButton!
   @IBOutlet weak var farRightPageButton: UIButton!
   
   // A real app would use a live API call instead of these sample json files
   var properties: USRealEstatePropertyModel?
   var displayProperties: [USRealEstatePropertyForSale] = []
   var rents: [Double]? = []
   var rvrValues: [Double] = []
   var indexZillow: Int = 0
   let format = Format()
   var dataManager = DataManager()
   
   
   override func viewDidLoad() {
      super.viewDidLoad()
      // An API using-app will request for user's location and pull data based on that.
      dropdownArray = [minDropdown, maxDropdown, rvDropdown, filterDropdown, pageDropdown]
      
      dataManager.delegate = self
      dataManager.setDefaultLocation()
      tableView.delegate = self
      tableView.dataSource = self
      tableView.register(UINib(nibName: TableViewCell.name, bundle: nil), forCellReuseIdentifier: TableViewCell.name)
      tableView.register(UINib(nibName: AdCell.name, bundle: nil), forCellReuseIdentifier: AdCell.name)
      configureDropdownButtons()
            
      Bundle.main.decode(file: "USRealEstateAPI.json", returnType: USRealEstatePropertyModel.self) { [weak self] result in
         switch result {
         case .failure(let error):
            print(error)
         case .success(let success):
            print("Success!")
            self?.properties = success
            self?.displayProperties = self!.properties!.data.results
            self?.displayProperties = self!.completeUSPropertyModel(properties: self!.displayProperties)
            
            DispatchQueue.main.async {
               self?.tableView.reloadData()
            }
         }
      }
   }
   
   // contains: [0. minButton, 1. maxButton, 2. rvButton, 3. filterButton]
   // not sure how else to use a non array data structure since I'm using tags for the buttons.
   @IBAction func filterButtonsTapped(_ sender: UIButton) {
      dropdownArray[sender.tag].show()
      dropdownArray[sender.tag].selectionAction = { [weak self] (index: Int, item: String) in
         sender.setTitle(item, for: .normal)
         self?.dropdownIndices[sender.tag] = index
         self?.applyFilters()
      }
   }
   
   @IBAction func pageButtonTapped(_ sender: UIButton) {
      pageDropdown.show()
      pageDropdown.selectionAction = { [weak self] (index: Int, item: String) in
         guard let _ = self else { return }
         sender.setTitle(item, for: .normal)
         self?.applyFilters()
      }
   }
}
