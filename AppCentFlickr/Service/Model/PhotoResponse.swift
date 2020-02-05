//
//  PhotoResponse.swift
//  AppCentFlickr
//
//  Created by Yusuf ali cezik on 5.02.2020.
//  Copyright © 2020 Yusuf Ali Cezik. All rights reserved.
//

import Foundation

public struct PhotoResponse: Decodable {
    
    public let results: [Photo]
    
    init(results: [Photo]) {
        self.results = results
    }
    
    private enum RootCodingKeys: String, CodingKey {
        case photos
    }
    
    private enum PhotosCodingKeys: String, CodingKey {
        case photo
    }
    
    public init(from decoder: Decoder) throws {
        let rootContainer = try decoder.container(keyedBy: RootCodingKeys.self)
        let photosContainer = try rootContainer.nestedContainer(keyedBy: PhotosCodingKeys.self, forKey: .photos)
        self.results = try photosContainer.decode([Photo].self, forKey: .photo)
    }
}
