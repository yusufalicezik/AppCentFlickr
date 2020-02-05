//
//  APIConstant.swift
//  AppCentFlickr
//
//  Created by Yusuf ali cezik on 5.02.2020.
//  Copyright © 2020 Yusuf Ali Cezik. All rights reserved.
//

import Foundation

struct APIConstant {
    private static let baseUrl: String = "https://www.flickr.com/services/rest/"
    private static let recentEndPoint: String = "flickr.photos.getRecent"
    private static let apiKey: String = "d64afbb07b382b05ac8082d197854500"
    private static let apiSig: String = "dc2144079d4de6ef07df8b24c26976b0"
    private static var perPage: Int = 20 //default
    private static var page: Int = 1
    
    public static var PAGE: Int {
        set {
            self.page = newValue
        }
        get {
            return self.page
        }
    }
    
    public static var PER_PAGE: Int {
        return self.perPage
    }
    
    public static var API_KEY: String {
        return apiKey
    }
    
    public static var BASE_URL: String {
        return self.baseUrl
    }
    
    public static var METHOD_ENDPOINT: String {
        return self.recentEndPoint
    }
    
    public static var FORMAT: String {
        return "json"
    }
    
    public static var API_SIG: String {
        return self.apiSig
    }
}

// https://www.flickr.com/services/rest/?method=flickr.photos.getRecent&api_key=d64afbb07b382b05ac8082d197854500&per_page=20&page=&format=json&nojsoncallback=1&api_sig=dc2144079d4de6ef07df8b24c26976b0
