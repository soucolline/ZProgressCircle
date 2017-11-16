//
//  ZProgressCircleTests.swift
//  ZProgressCircle_Example
//
//  Created by Zlatan on 16/11/2017.
//  Copyright © 2017 CocoaPods. All rights reserved.
//

import Quick
import Nimble

@testable import ZProgressCircle

class ZProgressCircleTests: QuickSpec {
  
  var progressCircle = ZProgressCircle()
  
  override func spec() {
    describe("ZProgressCircle component") {
      
      beforeEach {
        let frame = CGRect(x: 0, y: 0, width: 50, height: 50)
        self.progressCircle = ZProgressCircle(frame: frame)
      }
      
      it("should initialize ZProgressCircle component") {
        expect(self.progressCircle).to(beAKindOf(ZProgressCircle.self))
        expect(self.progressCircle.frame.height) == 50
        expect(self.progressCircle.frame.width) == 50
        expect(self.progressCircle.totalCount) == 10
        expect(self.progressCircle.completionCount) == 0
      }
      
      it("should add 1 to completion after increment call") {
        self.progressCircle.increment()
        expect(self.progressCircle.completionCount) == 1
      }
      
      it("should update completion count after setCompletion:to call") {
        self.progressCircle.setCompletion(to: 5)
        expect(self.progressCircle.completionCount) == 5
      }
      
      it("should complete circle if setCompletion is above totalCount") {
        self.progressCircle.setCompletion(to: 200)
        expect(self.progressCircle.isCompleted).to(beTrue())
      }
      
      
      // TODO guard against completion count < 0
    }
  }
}
