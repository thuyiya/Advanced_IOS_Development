//
//  nibmdevelopmentoneTests.swift
//  nibmdevelopmentoneTests
//
//  Created by thusitha on 8/14/20.
//  Copyright © 2020 nibm. All rights reserved.
//

import XCTest
@testable import nibmdevelopmentone

class nibmdevelopmentoneTests: XCTestCase {

    func testAddMath() {
        let math = Calculation()
        
        let result = math.addNumbers(x: 1, y: 2)
        
        XCTAssertEqual(result, 3)
    }
    
    func testMutipleMath() {
        let math = Calculation()
        
        let result = math.mutipleNumbers(x: 1, y: 2)
        
        XCTAssertEqual(result, 2)
    }
    
    func testDivideMath() {
        let math = Calculation()
        
        let result = math.divideNumers(x: 2, y: 2)
        
        XCTAssertEqual(result, 1)
    }
}
