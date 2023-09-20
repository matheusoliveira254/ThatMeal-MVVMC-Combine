//
//  CategoriesDataProvider.swift
//  ThatMeal-MVVMC
//
//  Created by Matheus Oliveira on 9/20/23.
//

import Foundation

protocol CategoriesServiceable {
    func fetchCategories(completion: @escaping (Result<TopLevelDictionaryCategory, NetworkError>) -> Void)
}

struct CategoriesService: CategoriesServiceable {
    private let service = Networking()
    private let baseCategoriesURL = "https://www.themealdb.com/api/json/v1/1/categories.php"
    
    func fetchCategories(completion: @escaping (Result<TopLevelDictionaryCategory, NetworkError>) -> Void) {
        guard let urlCategories = URL(string: baseCategoriesURL) else {completion(.failure(.badURL)); return}
        let request = URLRequest(url: urlCategories)
        
        service.perform(request) { result in
            switch result {
            case .success(let categoriesData):
                do {
                    let categories = try JSONDecoder().decode(TopLevelDictionaryCategory.self, from: categoriesData)
                    completion(.success(categories))
                } catch {
                    completion(.failure(.errorDecoding(error)))
                }
            case .failure(let error):
                completion(.failure(.requestError(error)))
            }
        }
    }
}//End of Struct
