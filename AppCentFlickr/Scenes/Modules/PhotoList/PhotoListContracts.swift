//
//  PhotoListContracts.swift
//  AppCentFlickr
//
//  Created by Yusuf ali cezik on 5.02.2020.
//  Copyright © 2020 Yusuf Ali Cezik. All rights reserved.
//

import Foundation

protocol PhotoListViewModelProtocol {
    var delegate: PhotoListViewModelDelegate? { get set }
    func load()
    func didSelectMovie(at index: Int)
}

enum PhotoListViewModelOutput {
    case setLoading(Bool)
    case showPhotoList([PhotoPresentation])
}

enum PhotoListViewRoute {
    case detail(DetailViewModelProtocol)
}

protocol PhotoListViewModelDelegate: class {
    func handleViewModelOutput(_ output: PhotoListViewModelOutput)
    func navigate(to route: PhotoListViewRoute)
}
