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
      var id: String
      var title: String
      var secret: String
      var farm: Int
      var server: String
    
    init(id: String, title: String, _ server: String, _ farm: Int, _ secret: String) {
        self.title = title
        self.id = id
        self.server = server
        self.farm = farm
        self.secret = secret
    }
}

extension PhotoPresentation {
    
    convenience init(photo: Photo) {
        self.init(id: photo.id ,title: photo.title, photo.server, photo.farm, photo.secret)
    }
}
