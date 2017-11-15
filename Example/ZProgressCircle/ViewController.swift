//
//  ViewController.swift
//  ZProgressCircle
//
//  Created by soucolline on 11/15/2017.
//  Copyright (c) 2017 soucolline. All rights reserved.
//

import UIKit
import ZProgressCircle

class ViewController: UIViewController {
  
  @IBOutlet weak var progressCircle: ProgressCircle!
  @IBOutlet weak var stepper: UIStepper!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    // Set stepper boundaries
    self.stepper.minimumValue = 0
    self.stepper.maximumValue = Double(self.progressCircle.totalCount)
    self.stepper.stepValue = 1.0
  }
  
  @IBAction func didPressStepper(_ sender: UIStepper) {
    self.progressCircle.setCompletion(to: Int(self.stepper.value))
  }
  
}

