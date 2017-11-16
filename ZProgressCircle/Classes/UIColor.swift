//
//  UIColor.swift
//  progressCircle
//
//  Created by Thomas Guilleminot on 11/09/16.
//  Copyright © 2016 Thomas Guilleminot. All rights reserved.
//

import Foundation
import UIKit

extension UIColor {
  
  static func fromRGB(rgbValue: UInt) -> UIColor {
    return UIColor(
      red: CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0,
      green: CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0,
      blue: CGFloat(rgbValue & 0x0000FF) / 255.0,
      alpha: CGFloat(1.0)
    )
  }
  
}
