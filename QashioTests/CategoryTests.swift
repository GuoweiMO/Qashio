//
//  testCategory.swift
//  Qashio
//
//  Created by Guowei Mo on 02/12/2015.
//  Copyright © 2015 Guowei Mo. All rights reserved.
//

import XCTest
@testable import Qashio

class CategoryTests: XCTestCase {
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }
    
    func testCategoryData(){
        let categoryObj = Qashio.Category()
        XCTAssertNotNil(categoryObj.categoryData, "category data is not nil")
        XCTAssertEqual(categoryObj.categoryData.count, 10, "category data has 10 items")
    }
    
    func testCateResData(){
        let categoryObj = Qashio.Category()
        XCTAssertNotNil(categoryObj.catResource, "category resource is not nil")
        XCTAssertEqual(categoryObj.catResource.count, 10,"category resource has 10 items")
    }
    
    func testAddSubCategory(){
        let categoryObj = Qashio.Category()
        XCTAssertEqual(categoryObj.selectedCategories.count, 0, "The initial selected category list is empty")
        categoryObj.addSelectedSubCategory("IT", subCategoryToAdd: "Cloud")
        XCTAssertEqual(categoryObj.selectedCategories.count, 1, "The count of selected category is 1")
        XCTAssertEqual(categoryObj.selectedCategories["IT"], ["Cloud"])
    }
    
    func testRemoveSubCategory(){
        let categoryObj = Qashio.Category()
        XCTAssertEqual(categoryObj.selectedCategories.count, 0, "The initial selected category list is empty")
        categoryObj.addSelectedSubCategory("IT", subCategoryToAdd: "Cloud")
        categoryObj.removeunSelectedSubCategory("IT", subCategoryToRemove: "Cloud")
        XCTAssertEqual(categoryObj.selectedCategories["IT"], [])
    }
    
    func testSameKeysForCategoryAndResource(){
        let categoryObj = Qashio.Category()
        XCTAssertEqual(Array(categoryObj.categoryData.keys), Array(categoryObj.catResource.keys))
    }
    
}
