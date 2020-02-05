//
//  Photo.swift
//  AppCentFlickr
//
//  Created by Yusuf ali cezik on 5.02.2020.
//  Copyright © 2020 Yusuf Ali Cezik. All rights reserved.
//

import Foundation

public struct Photo: Decodable {
    var id: String
    var owner: String
    var title: String
    var secret: String
    var farm: Int
    var server: String
}
