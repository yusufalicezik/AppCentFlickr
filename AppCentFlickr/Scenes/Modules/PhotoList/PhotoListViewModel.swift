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
    
    init(service: DataServiceProtocol) {
        self.service = service
    }
    
    func load() {
        delegate?.handleViewModelOutput(.setLoading(true))
        service.getPhotosFromService { [weak self] result in
            guard let self = self else { return }
            switch result {
            case .success(let response):
                self.photos = response.results
                let presentations = response.results.map({ PhotoPresentation(photo: $0) })
                self.delegate?.handleViewModelOutput(.showPhotoList(presentations))
            case .failure(let error):
                print(error)
            }
        }
    }
    
    func didSelectMovie(at index: Int) {
        
    }
    
    
}
