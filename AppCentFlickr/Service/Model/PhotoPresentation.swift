//
//  PhotoPresentation.swift
//  AppCentFlickr
//
//  Created by Yusuf ali cezik on 5.02.2020.
//  Copyright © 2020 Yusuf Ali Cezik. All rights reserved.
//

import Foundation

//Modeli viewdan ayırmak için DTO görevi gören presentation sınıfı
class PhotoPresentation: NSObject {
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
    
    override func isEqual(_ object: Any?) -> Bool {
        guard let other = object as? PhotoPresentation else { return false }
        return self.id == other.id
    }
}

extension PhotoPresentation {
    convenience init(photo: Photo) {
        self.init(id: photo.id ,title: photo.title, photo.server, photo.farm, photo.secret)
    }
}
