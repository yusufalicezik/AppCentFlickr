//
//  DetailViewController.swift
//  AppCentFlickr
//
//  Created by Yusuf ali cezik on 5.02.2020.
//  Copyright © 2020 Yusuf Ali Cezik. All rights reserved.
//

import UIKit
import SDWebImage

final class DetailViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    
    var viewModel: DetailViewModelProtocol! {
        didSet {
            viewModel.delegate = self
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.load()
    }
}

extension DetailViewController: DetailViewModelDelegate {
    func showFullImage(_ presentation: PhotoPresentation) {
        imageView.sd_setImage(with: URL(string: "https://farm\(presentation.farm).staticflickr.com/\(presentation.server)/\(presentation.id)_\(presentation.secret)_m_d.jpg"), completed: nil)
    }
}
