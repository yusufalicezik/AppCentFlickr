//
//  ViewController.swift
//  AppCentFlickr
//
//  Created by Yusuf ali cezik on 5.02.2020.
//  Copyright © 2020 Yusuf Ali Cezik. All rights reserved.
//

import UIKit

class PhotoListViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    var viewModel: PhotoListViewModelProtocol! {
        didSet {
            viewModel.delegate = self
        }
    }
    
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

    }
}

extension PhotoListViewController: PhotoListViewModelDelegate {
    func handleViewModelOutput(_ output: PhotoListViewModelOutput) {
        switch output {
        case .setLoading(let isLoading):
            print(isLoading)
        case .showPhotoList(let photos):
            self.photoList = photos
            self.tableView.reloadData()
        }
    }
}

extension PhotoListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return photoList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        cell.textLabel?.text = photoList[indexPath.row].title
        return cell
    }
}

extension PhotoListViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath){
        
    }
}

