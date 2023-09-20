//
//  CollectionViewController.swift
//  ThatMeal-MVVMC
//
//  Created by Matheus Oliveira on 9/11/23.
//

import UIKit
import Combine


protocol UIUpdatable {
    func updateUI()
}

private let reuseIdentifier = "Cell"

class CategoriesCollectionViewController: UICollectionViewController {

    var viewModel: CategoriesViewModel!
    var cancellables: Set<AnyCancellable> = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.collectionView!.register(UICollectionViewCell.self, forCellWithReuseIdentifier: reuseIdentifier)
        viewModel = CategoriesViewModel()
        viewModel.$categoryNames.sink { [weak self] _ in
            self?.updateUI()
        }
        .store(in: &cancellables)
        viewModel.loadCategoryNames()
    }

    deinit {
        cancellables.forEach { cancellable in
            cancellable.cancel()
        }
    }
    
    // MARK: UICollectionViewDataSource

    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.categoryNames.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "categoryCell", for: indexPath) as! CategoriesCollectionViewCell
        let category = viewModel.categoryNames[indexPath.row]
        DispatchQueue.main.async {
            cell.configureCollectionViewCell(with: category)
        }
        return cell
    }
}//End of class

extension CategoriesCollectionViewController: UIUpdatable {
    func updateUI() {
        DispatchQueue.main.async {
            self.collectionView.reloadData()
        }
    }
}//End of Extension
