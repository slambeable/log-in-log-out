//
//  ColorsForView.swift
//  LogInLogOut
//
//  Created by Андрей Евдокимов on 18.12.2021.
//

import UIKit

class GradientForView {
    let colorTop = UIColor(red: 0.45, green: 0.29, blue: 0.43, alpha: 1.00).cgColor
    let colorBottom = UIColor(red: 0.26, green: 0.15, blue: 0.35, alpha: 1.00).cgColor

    let gradientLayer: CAGradientLayer

  init() {
    gradientLayer = CAGradientLayer()
    gradientLayer.colors = [colorTop, colorBottom]
    gradientLayer.locations = [0.0, 1.0]
  }
}
