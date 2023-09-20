//
//  CategoriesViewModel.swift
//  ThatMeal-MVVMC
//
//  Created by Matheus Oliveira on 9/11/23.
//

import Foundation
import Combine

class CategoriesViewModel {
    private let categoriesService: CategoriesServiceable
    @Published var categoryNames: [Category] = []
    
    init(categoriesService: CategoriesServiceable = CategoriesService()) {
        self.categoriesService = categoriesService
    }
    
    func loadCategoryNames() {
        categoriesService.fetchCategories { [weak self] result in
            switch result {
            case .success(let categories):
                self?.categoryNames = []
                self?.categoryNames.append(contentsOf: categories.categories)
            case .failure(let error):
                print("Error fetching the data", error.localizedDescription)
            }
        }
    }
}//End of class
