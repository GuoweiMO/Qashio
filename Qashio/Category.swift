//
//  Category.swift
//  Qashio
//
//  Created by Guowei Mo on 23/11/2015.
//  Copyright © 2015 Guowei Mo. All rights reserved.
//

import Foundation

class Category {
    var categoryData: Dictionary<String, Set<String>>
    var selectedCategories: Dictionary<String, Set<String>>
    
    init(){
        self.categoryData = Dictionary<String, Set<String>>()
        
        self.selectedCategories = Dictionary<String, Set<String>>()
    }
    
    func setSelectedCategories(category:String, subCategories subCates:[String]){
//        let selectedCate = [category : subCates]
//        self.selectedCategories.append(selectedCate)
    }
    
    func addSelectedSubCategory(mainCate:String, subCategoryToAdd subCate:String){
        if self.selectedCategories[mainCate] == nil {
            self.selectedCategories[mainCate] = Set<String>()
        }
        
        var subCateSet = self.selectedCategories[mainCate]! as Set<String>
        if !subCateSet.contains(subCate){
            subCateSet.insert(subCate)
        }
        self.selectedCategories.updateValue(subCateSet, forKey: mainCate)
    }
    
    func removeunSelectedSubCategory(mainCate:String, subCategoryToRemove subCate:String){
        var subCateSet = self.selectedCategories[mainCate]! as Set<String>
        if subCateSet.contains(subCate){
            subCateSet.remove(subCate)
        }
        self.selectedCategories.updateValue(subCateSet, forKey: mainCate)
    }
}