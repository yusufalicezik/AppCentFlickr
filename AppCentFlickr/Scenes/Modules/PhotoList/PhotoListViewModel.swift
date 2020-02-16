//
//  PhotoListViewModel.swift
//  AppCentFlickr
//
//  Created by Yusuf ali cezik on 5.02.2020.
//  Copyright © 2020 Yusuf Ali Cezik. All rights reserved.
//

import Foundation

final class PhotoListViewModel: PhotoListViewModelProtocol {
    
    weak var delegate: PhotoListViewModelDelegate?
    private let service: DataServiceProtocol
    private var photos: [Photo] = []
    private var currentPage = 1
    
    init(service: DataServiceProtocol) {
        self.service = service
    }
    
    func load() {
        delegate?.handleViewModelOutput(.setLoading(true))
        service.getPhotosFromService(page: currentPage) { [weak self] result in
            guard let self = self else { return }
            self.delegate?.handleViewModelOutput(.setLoading(false))
            switch result {
            case .success(let response):
                self.currentPage+=1
                self.photos.append(contentsOf: response.results)
                let presentations = response.results.map({ PhotoPresentation(photo: $0) })
                self.delegate?.handleViewModelOutput(.showPhotoList(presentations))
            case .failure(let error):
                print(error)
            }
        }
    }
    
    func didSelectPhoto(at index: Int) {
        let photo = photos[index]
        let viewModel = DetailViewModel(photo: photo)
        delegate?.navigate(to: .detail(viewModel))
    }
    
    
}
