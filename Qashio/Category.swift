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
    var catResource: Dictionary<String,String>
    var selectedCategories: Dictionary<String, Set<String>>
    
    init(){
        self.categoryData = Dictionary<String, Set<String>>()
        self.categoryData = [
            "IT"            :   ["Hardware", "Cloud", "Network" , "Mobile", "Gaming"],
            "Science"       :   ["Mathematics", "Physics", "Chemistry", "Biology"],
            "Finance"       :   ["Fixed-Income", "Asset Management", "Risk", "Investment"],
            "Business"      :   ["Consultancy", "Marketing", "Management"],
            "Design"        :   ["Product","Web", "Innovation", "Advert"],
            "Art"           :   ["Modern", "Impression", "Hyper-reality"],
            "Music"         :   ["Jazz", "Countryside", "Rock", "Rap"],
            "Sports"        :   ["Football", "Tennis", "Rugby", "Skiing"],
            "Engineering"   :   ["Physical", "Mechanical", "Chemical", "Biological"],
            "Humanity"      :   ["Literature", "History", "Philosophy", "Politics"]
        ]
        self.selectedCategories = Dictionary<String, Set<String>>()
        self.catResource = [
            "IT"            :   "IT-ico",
            "Science"       :   "science-ico",
            "Finance"       :   "finance-ico",
            "Business"      :   "business-ico",
            "Design"        :   "design-ico",
            "Art"           :   "art-ico",
            "Music"         :   "music-ico",
            "Sports"        :   "sports-ico",
            "Engineering"   :   "engineering-ico",
            "Humanity"      :   "human-ico"

        ]
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