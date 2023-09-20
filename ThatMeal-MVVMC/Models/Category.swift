//
//  Category.swift
//  ThatMeal-MVVMC
//
//  Created by Matheus Oliveira on 9/9/23.
//

import Foundation

struct TopLevelDictionaryCategory: Decodable {
    let categories: [Category]
}

struct Category: Decodable {
    let strCategory: String?
    let strCategoryThumb: String?
}
