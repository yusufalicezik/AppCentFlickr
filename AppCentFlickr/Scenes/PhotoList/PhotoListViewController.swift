//
//  ViewController.swift
//  AppCentFlickr
//
//  Created by Yusuf ali cezik on 5.02.2020.
//  Copyright © 2020 Yusuf Ali Cezik. All rights reserved.
//

import UIKit

class PhotoListViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        DataService.shared.getPhotosFromService { (res) in
            switch res {
            case .success(let response):
                print(response.results)
            
            default:
                print("asd")
            }
            
        }
    }


}

