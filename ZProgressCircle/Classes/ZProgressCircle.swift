//
//  ZProgressCircle.swift
//  ZProgressCircle
//
//  Created by Zlatan on 15/11/17.
//  Copyright © 2017 Thomas Guilleminot. All rights reserved.
//
import UIKit
import Darwin

let pi: CGFloat = .pi
let startAngle: CGFloat = (3.0 * pi) / 2.0

@IBDesignable
open class ZProgressCircle: UIView {
  
  var countLabel: UILabel!
  var containerView: UIView!
  var remainingCount: Int = 0
  var isCompleted: Bool = false
  var filledLayer: CAShapeLayer!
  
  fileprivate var _totalCount:Int = 10
  @IBInspectable public var totalCount:Int {
    get {
      return self._totalCount
    }
    
    set (newValue) {
      self._totalCount = newValue
      self.countLabel.text = String(_totalCount)
      self.setNeedsDisplay()
    }
  }
  
  fileprivate var _completionCount: Int = 0
  @IBInspectable var completionCount: Int {
    get {
      return self._completionCount
    }
    
    set (newValue) {
      self._completionCount = newValue
      self.remainingCount = self.totalCount - newValue
      self.setNeedsDisplay()
    }
  }
  
  @IBInspectable var percentComplete: CGFloat = 0
  @IBInspectable var completeColor:UIColor = UIColor.fromRGB(rgbValue: 0x96E5B8)
  @IBInspectable var originalColor:UIColor = UIColor.fromRGB(rgbValue: 0x3498db)
  @IBInspectable var fillingColor:UIColor = UIColor.fromRGB(rgbValue: 0x2ECC71)
  
  override open func draw(_ rect: CGRect) {
    super.draw(rect)
    
    guard let context = UIGraphicsGetCurrentContext()
      else { return }
    
    self.countLabel.font = self.countLabel.font.withSize(rect.width / 2)
    
    if self.filledLayer != nil {
      self.filledLayer.removeFromSuperlayer()
    }
    
    let endAngle = ZProgressCircle.percentToRadians(percentComplete)
    context.setLineWidth(4.0)
    
    // Create fixed circle
    let rectangle = CGRect(x: 0,y: 0,width: rect.size.width,height: rect.size.height)
    context.setFillColor(originalColor.cgColor)
    context.addEllipse(in: rectangle)
    context.fillEllipse(in: rectangle)
    
    // Create animated circle
    let filledPathStart = UIBezierPath(
      arcCenter: CGPoint(
        x: rect.size.width / 2,
        y: rect.size.height / 2),
      radius: (rect.size.height / 2),
      startAngle: startAngle,
      endAngle: endAngle,
      clockwise: true
    )
    filledPathStart.addLine(to: CGPoint(
      x: rect.size.width / 2,
      y: rect.size.height / 2)
    )
    self.filledLayer = CAShapeLayer()
    self.filledLayer.path = filledPathStart.cgPath
    self.filledLayer.fillColor = fillingColor.cgColor
    self.filledLayer.frame.size.height = rectangle.size.height / 2
    
    self.containerView?.layer.sublayers?.first?.removeFromSuperlayer()
    self.containerView?.removeFromSuperview()
    self.containerView = UIView(frame: rect)
    self.containerView.layer.addSublayer(filledLayer)
    
    self.addSubview(containerView)
    
    // Check if circle is full
    if completionCount == totalCount {
      self.countLabel.text = String(self.totalCount)
    }
    
    if self.completionCount > 0 {
      context.setFillColor(completeColor.cgColor)
      context.addEllipse(in: rectangle)
      context.fillEllipse(in: rectangle)
      context.strokePath()
    }
  }
  
  // Animated circle
  internal func runAnimation() {
    self.percentComplete = CGFloat(
      100 - (Double(remainingCount) / Double(totalCount) * 100))
    print("TOTAL COUNT : \(totalCount)")
    print("COMPLETION COUNT : \(completionCount)")
    print("REMAINING COUNT : \(remainingCount)")
    print("percentComplete: \(self.percentComplete)")
    self.setNeedsDisplay()
  }
  
  // Remove 1 item to count
  internal func increment() {
    guard self.completionCount < totalCount
      else { return }
    
    self.completionCount += 1
    self.countLabel.text = String(completionCount)
    self.runAnimation()
    
    if completionCount == totalCount {
      self.setNeedsDisplay()
      self.isCompleted = true
      return
    }
  }
  
  // Set completion to desired value
  public func setCompletion(to value:Int) {
    guard value < self.totalCount else {
      self.completionCount = self.totalCount - 1;
      self.increment()
      return
    }
    
    self.completionCount = value;
    self.countLabel.text = String(value > 0 ? value : self.totalCount)
    self.runAnimation()
  }
  
  // Initialize label
  internal func initialize() {
    self.countLabel = UILabel()
    self.countLabel.translatesAutoresizingMaskIntoConstraints = false
    self.countLabel.adjustsFontSizeToFitWidth = true
    self.countLabel.minimumScaleFactor = 2
    self.countLabel.textColor = UIColor.white
    self.countLabel.textAlignment = .center
    self.countLabel.layer.zPosition = 1
    
    self.addSubview(countLabel)
    
    // countLabel edges to 0
    self.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-0-[view]-0-|", options: NSLayoutFormatOptions(rawValue: 0), metrics: nil, views: ["view": countLabel]));
    
    self.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|-0-[view]-0-|", options: NSLayoutFormatOptions(rawValue: 0), metrics: nil, views: ["view": countLabel]));
    
    self.percentComplete = 0
    self._totalCount = self.totalCount
    self.countLabel.text = String(_totalCount)
  }
  
  required public init?(coder aDecoder: NSCoder) {
    super.init(coder: aDecoder)
    self.initialize()
  }
  
  public override init(frame: CGRect) {
    super.init(frame: frame)
    self.initialize()
  }
}

extension ZProgressCircle {
  
  static func percentToRadians(_ percentComplete: CGFloat) -> CGFloat {
    let degrees = (percentComplete/100) * 360
    return startAngle + (degrees * (pi/180))
  }
  
}
