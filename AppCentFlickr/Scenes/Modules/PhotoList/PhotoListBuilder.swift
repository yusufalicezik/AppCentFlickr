//
//  PhotoListBuilder.swift
//  AppCentFlickr
//
//  Created by Yusuf ali cezik on 5.02.2020.
//  Copyright © 2020 Yusuf Ali Cezik. All rights reserved.
//

import UIKit

final class PhotoListBuilder {
    
    static func make() -> PhotoListViewController {
        let storyboard = UIStoryboard(name: "Photo", bundle: nil)
        let viewController = storyboard.instantiateViewController(identifier: "PhotoListVC") as! PhotoListViewController
        viewController.viewModel = PhotoListViewModel(service: app.service)
        return viewController
    }
}
