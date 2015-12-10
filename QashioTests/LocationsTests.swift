//
//  LocationsTests.swift
//  Qashio
//
//  Created by Guowei Mo on 02/12/2015.
//  Copyright © 2015 Guowei Mo. All rights reserved.
//

import XCTest
@testable import Qashio

class LocationsTests: XCTestCase {
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testLocationsData() {
        XCTAssertNotNil(Locations.LocConf.locations)
        XCTAssertEqual(Locations.LocConf.locations.count, 3)
    }
}
