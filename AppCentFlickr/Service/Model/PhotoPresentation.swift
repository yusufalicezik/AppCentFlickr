//
//  PhotoPresentation.swift
//  AppCentFlickr
//
//  Created by Yusuf ali cezik on 5.02.2020.
//  Copyright © 2020 Yusuf Ali Cezik. All rights reserved.
//

import Foundation

//Modeli viewdan ayırmak için DTO görevi gören presentation sınıfı
class PhotoPresentation {
    let imageUrl:String
    let title: String
    
    init(imageUrl: String, title: String) {
        self.title = title
        self.imageUrl = imageUrl
    }
}

extension PhotoPresentation {
    
    convenience init(photo: Photo) {
        self.init(imageUrl: photo.secret ,title: photo.title)
    }
}
