//
//  ViewController.swift
//  AppCentFlickr
//
//  Created by Yusuf ali cezik on 5.02.2020.
//  Copyright © 2020 Yusuf Ali Cezik. All rights reserved.
//

import UIKit
import JGProgressHUD

class PhotoListViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    var viewModel: PhotoListViewModelProtocol! {
        didSet {
            viewModel.delegate = self
        }
    }
    
    private let hud = JGProgressHUD(style: .dark)
    private var photoList: [PhotoPresentation] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupVC()
        viewModel.load()
    }
    
    private func setupVC(){
        tableView.register(UINib(nibName: "PhotoCell", bundle: nil), forCellReuseIdentifier: "cell")
        tableView.delegate = self
        tableView.dataSource = self
        self.navigationController?.navigationBar.barTintColor = #colorLiteral(red: 0.9311670661, green: 0.2990694046, blue: 0.3270647526, alpha: 1)
        self.navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor : UIColor.white]
        hud.textLabel.text = "Yükleniyor"
    }
}

extension PhotoListViewController: PhotoListViewModelDelegate {
    
    func handleViewModelOutput(_ output: PhotoListViewModelOutput) {
        switch output {
        case .setLoading(let isLoading):
            isLoading ? hud.show(in: self.view) : hud.dismiss()
        case .showPhotoList(let photos):
            self.photoList.append(contentsOf: photos)
            self.tableView.reloadData()
        }
    }
    
    func navigate(to route: PhotoListViewRoute) {
        switch route {
        case .detail(let viewModel):
            let detailVC = DetailBuilder.make(with: viewModel)
            show(detailVC, sender: nil)
        }
    }
}

extension PhotoListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return photoList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? PhotoCell
        cell?.photo = photoList[indexPath.row]
        return cell!
    }
    
    //Paging
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        if indexPath.row == self.photoList.count-1 {
            viewModel.load()
        }
    }
}

extension PhotoListViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath){
        viewModel.didSelectMovie(at: indexPath.row)
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100.0
    }
}

