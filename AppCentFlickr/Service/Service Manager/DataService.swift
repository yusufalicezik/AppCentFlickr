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
    func getPhotosFromService(page: Int, completion: @escaping (Result<PhotoResponse>)->Void)
}

public class DataService: DataServiceProtocol {
    
    static let shared = DataService()
    
    private init() { } //singleton
    
    public func getPhotosFromService(page: Int, completion: @escaping (Result<PhotoResponse>) -> Void) {
        APIConstant.PAGE = page
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
                }catch(let err) {
                    completion(.failure(err))
                }
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
}

