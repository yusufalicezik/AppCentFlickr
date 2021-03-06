//
//  DetailViewModel.swift
//  AppCentFlickr
//
//  Created by Yusuf ali cezik on 5.02.2020.
//  Copyright © 2020 Yusuf Ali Cezik. All rights reserved.
//

import Foundation

class DetailViewModel: DetailViewModelProtocol {
    
    weak var delegate: DetailViewModelDelegate?
    private let presentation: PhotoPresentation
    
    init(photo: Photo) {
        self.presentation = PhotoPresentation(photo: photo)
    }
    
    func load() {
        delegate?.showFullImage(presentation)
    }
}
