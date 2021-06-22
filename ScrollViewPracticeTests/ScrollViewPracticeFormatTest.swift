//
//  ScrollViewPracticeFormatTest.swift
//  ScrollViewPracticeTests
//
//  Created by Ryan Kanno on 6/8/21.
//

import XCTest
@testable import ScrollViewPractice

class ScrollViewPracticeFormatTest: XCTestCase {
   let format = Format()
   
   func testRentEstimateURL() {
      let url1 = format.rentEstimateURL("15818 Cherrylawn St", "Detroit", "MI")
      let url2 = format.rentEstimateURL("3409 Hammond St", "Detroit", "MI")
      let url3 = format.rentEstimateURL("10700 SW 108th Ave APT C213", "Miami", "FL")
      let url4 = format.rentEstimateURL("125 E 93rd St APT 9C", "New York", "NY")
      let url5 = format.rentEstimateURL("2215 Aspen Dr", "Dallas", "TX")
      XCTAssertEqual(url1, "15818%20Cherrylawn%20St%2C%20Detroit%2C%20MI")
      XCTAssertEqual(url2, "3409%20Hammond%20St%2C%20Detroit%2C%20MI")
      XCTAssertEqual(url3, "10700%20SW%20108th%20Ave%20APT%20C213%2C%20Miami%2C%20FL")
      XCTAssertEqual(url4, "125%20E%2093rd%20St%20APT%209C%2C%20New%20York%2C%20NY")
      XCTAssertEqual(url5, "2215%20Aspen%20Dr%2C%20Dallas%2C%20TX")
   }
   
   func testDollarString() {
      let dollarString1 = format.dollarString("1000")
      let dollarString2 = format.dollarString("30")
      let dollarString3 = format.dollarString("3251037")
      let dollarString4 = format.dollarString("65103510651")
      let dollarString5 = format.dollarString("606540684686840")
      XCTAssertEqual(dollarString1, "$1,000")
      XCTAssertEqual(dollarString2, "$30")
      XCTAssertEqual(dollarString3, "$3,251,037")
      XCTAssertEqual(dollarString4, "$65,103,510,651")
      XCTAssertEqual(dollarString5, "$606,540,684,686,840")
   }
   
   func testNumberString() {
      let numString1 = format.numberString("4000")
      let numString2 = format.numberString("652068")
      let numString3 = format.numberString("100")
      let numString4 = format.numberString("65103510651")
      let numString5 = format.numberString("20550")
      XCTAssertEqual(numString1, "4,000")
      XCTAssertEqual(numString2, "652,068")
      XCTAssertEqual(numString3, "100")
      XCTAssertEqual(numString4, "65,103,510,651")
      XCTAssertEqual(numString5, "20,550")
   }
   
   func testGetZillowHomesURL() {
      let url1 = format.getZillowHomesURL("15818 Cherrylawn St", "Detroit", "MI", "48238")
      let url2 = format.getZillowHomesURL("3409 Hammond St", "Detroit", "MI", "48210")
      let url3 = format.getZillowHomesURL("10700 SW 108th Ave APT C213", "Miami", "FL", "33176")
      let url4 = format.getZillowHomesURL("125 E 93rd St APT 9C", "New York", "NY", "10128")
      let url5 = format.getZillowHomesURL("2215 Aspen Dr", "Dallas", "TX", "75227")
      XCTAssertEqual(url1, "\(URLs.zillowHomesURL)15818-Cherrylawn-St-Detroit-MI-48238_rb/")
      XCTAssertEqual(url2, "\(URLs.zillowHomesURL)3409-Hammond-St-Detroit-MI-48210_rb/")
      XCTAssertEqual(url3, "\(URLs.zillowHomesURL)10700-SW-108th-Ave-APT-C213-Miami-FL-33176_rb/")
      XCTAssertEqual(url4, "\(URLs.zillowHomesURL)125-E-93rd-St-APT-9C-New-York-NY-10128_rb/")
      XCTAssertEqual(url5, "\(URLs.zillowHomesURL)2215-Aspen-Dr-Dallas-TX-75227_rb/")
   }
   
   func testDollarsToInt() {
      let amount1 = format.dollarsToInt(dollarAmount: "$100,000")
      let amount2 = format.dollarsToInt(dollarAmount: "$200,000")
      let amount3 = format.dollarsToInt(dollarAmount: "$300,000")
      let amount4 = format.dollarsToInt(dollarAmount: "$400,000")
      let amount5 = format.dollarsToInt(dollarAmount: "$500,000")
      XCTAssertEqual(amount1, 100000)
      XCTAssertEqual(amount2, 200000)
      XCTAssertEqual(amount3, 300000)
      XCTAssertEqual(amount4, 400000)
      XCTAssertEqual(amount5, 500000)
   }
   
   func testRvrToDouble() {
      let rvr1 = format.rvrToDouble(rvrString: "0.1%")
      let rvr2 = format.rvrToDouble(rvrString: "0.3%")
      let rvr3 = format.rvrToDouble(rvrString: "0.5%")
      let rvr4 = format.rvrToDouble(rvrString: "0.7%")
      let rvr5 = format.rvrToDouble(rvrString: "1.1%")
      XCTAssertEqual(rvr1, 0.1)
      XCTAssertEqual(rvr2, 0.3)
      XCTAssertEqual(rvr3, 0.5)
      XCTAssertEqual(rvr4, 0.7)
      XCTAssertEqual(rvr5, 1.1)
   }
   
   func testListDateToInt() {
      let date1 = format.listDateToInt("2021-06-04T21:13:14Z")
      let date2 = format.listDateToInt("2021-06-04T20:23:13Z")
      let date3 = format.listDateToInt("2021-06-02T16:28:17Z")
      let date4 = format.listDateToInt("2021-05-30T07:31:03Z")
      let date5 = format.listDateToInt("2021-05-27T15:35:26Z")
      XCTAssertEqual(date1, 20210604)
      XCTAssertEqual(date2, 20210604)
      XCTAssertEqual(date3, 20210602)
      XCTAssertEqual(date4, 20210530)
      XCTAssertEqual(date5, 20210527)
   }
   
}
