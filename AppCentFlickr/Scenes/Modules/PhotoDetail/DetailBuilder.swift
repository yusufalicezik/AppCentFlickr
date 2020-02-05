//
//  DetailBuilder.swift
//  AppCentFlickr
//
//  Created by Yusuf ali cezik on 5.02.2020.
//  Copyright © 2020 Yusuf Ali Cezik. All rights reserved.
//

import UIKit

final class DetailBuilder {
    
    static func make(with viewModel: DetailViewModelProtocol) -> DetailViewController {
        let storyboard = UIStoryboard(name: "Photo", bundle: nil)
        let viewController = storyboard.instantiateViewController(identifier: "PhotoDetailVC") as! DetailViewController
        viewController.viewModel = viewModel
        return viewController
    }
}
