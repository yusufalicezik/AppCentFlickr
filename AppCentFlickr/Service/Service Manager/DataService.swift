//
//  DataService.swift
//  AppCentFlickr
//
//  Created by Yusuf ali cezik on 5.02.2020.
//  Copyright © 2020 Yusuf Ali Cezik. All rights reserved.
//

import Foundation
import Alamofire

public protocol DataServiceProtocol {
    func getPhotosFromService(completion: @escaping (Result<PhotoResponse>)->Void)
}

public class DataService: DataServiceProtocol {
    
    static let shared = DataService()
    
    private init() { } //singleton
    
    public func getPhotosFromService(completion: @escaping (Result<PhotoResponse>) -> Void) {
        let params = [
            "method": APIConstant.METHOD_ENDPOINT,
            "api_key": APIConstant.API_KEY,
            "per_page": String(APIConstant.PER_PAGE),
            "page": String(APIConstant.PAGE),
            "format": APIConstant.FORMAT,
            "nojsoncallback": "1"
        ] as [String : String]
        
        Alamofire.request(APIConstant.BASE_URL, method: .get, parameters: params)
            .responseJSON { response in
            switch response.result {
            case .success:
                do {
                    let response = try JSONDecoder().decode(PhotoResponse.self, from: response.data!)
                    completion(.success(response))
                }catch {
                    
                }
            case .failure(let error):
                print(error)
            }
        }
    }
}

//https://www.flickr.com/services/rest/?method=flickr.photos.getRecent&api_key=d64afbb07b382b05ac8082d197854500&per_page=20&page=1&format=json&nojsoncallback=1

