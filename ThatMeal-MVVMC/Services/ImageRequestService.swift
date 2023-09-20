//
//  ImageRequestService.swift
//  ThatMeal-MVVMC
//
//  Created by Matheus Oliveira on 9/18/23.
//

import Foundation
import UIKit
//Async image view
class ServiceRequestImageView: UIImageView {
    private let service = Networking()
    func fetch(using url: URL) {
        let request = URLRequest(url: url)
        service.perform(request) { [weak self] result in
            switch result {
            case .failure:
                print("Error fetching Image" )
            case .success(let imageData):
                guard let image = UIImage(data: imageData) else {return}
                DispatchQueue.main.async {
                    self?.contentMode = .scaleToFill
                    self?.image = image
                }
            }
        }
    }
}//End of class
