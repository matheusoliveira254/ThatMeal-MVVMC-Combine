//
//  MealList.swift
//  ThatMeal-MVVMC
//
//  Created by Matheus Oliveira on 9/9/23.
//

import Foundation

struct TopLevelDictionaryMeals: Decodable {
    let meals: [Meal]
}

struct Meal: Decodable {
    let strMeal: String?
    let strMealThumb: String?
    let idMeal: String?
}
