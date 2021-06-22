//
//  Attributes.swift
//  ScrollViewPractice
//
//  Created by Ryan Kanno on 6/8/21.
//

import UIKit

struct Attributes {
   static let strokeTextAttributes = [
      NSAttributedString.Key.strokeColor : UIColor.black,
      NSAttributedString.Key.foregroundColor : UIColor.red,
      NSAttributedString.Key.strokeWidth : 1,
      NSAttributedString.Key.font : UIFont.systemFont(ofSize: 40, weight: UIFont.Weight.light)
   ] as [NSAttributedString.Key : Any]
   
}
