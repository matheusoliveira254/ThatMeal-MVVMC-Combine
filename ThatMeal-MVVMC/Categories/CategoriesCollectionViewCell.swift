//
//  CategoriesCollectionViewCell.swift
//  ThatMeal-MVVMC
//
//  Created by Matheus Oliveira on 9/11/23.
//

import UIKit

class CategoriesCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var categoryNameLabel: UILabel!
    @IBOutlet weak var categoryImageServiceRequestImageView: ServiceRequestImageView!
    
    func configureCollectionViewCell(with category: Category?) {
        guard let category else {return}
        fetchImage(for: category)
        makeRounded()
        categoryNameLabel.text = category.strCategory
    }
    
    func fetchImage(for category: Category) {
        guard let imageURL = URL(string: category.strCategoryThumb ?? "No Image URL for this category") else {print("Invalid Image URL"); return}
        categoryImageServiceRequestImageView.fetch(using: imageURL)
    }
    
    func makeRounded() {
        categoryImageServiceRequestImageView.layer.cornerRadius = 45
        categoryImageServiceRequestImageView.clipsToBounds = true
    }
}
