//
//  AppCentFlickrTests.swift
//  AppCentFlickrTests
//
//  Created by Yusuf ali cezik on 16.02.2020.
//  Copyright © 2020 Yusuf Ali Cezik. All rights reserved.
//

import XCTest
@testable import AppCentFlickr

class AppCentFlickrTests: XCTestCase {
    
    private var view: MockView!
    private var viewModel: PhotoListViewModelProtocol!
    private var service: MockPhotosService!

    override func setUp() {
        service = MockPhotosService()
        viewModel = PhotoListViewModel(service: service)
        view = MockView()
        viewModel.delegate = view
    }

    func test_load() throws {
        //Given
        let photo1 = Photo(id: "1", owner: "OwnerName", title: "Title", secret: "1", farm: 1, server: "server1")
        let photo2 = Photo(id: "2", owner: "OwnerName2", title: "Title2", secret: "2", farm: 2, server: "server2")
        service.photos = [photo1, photo2]
        
        //When
        viewModel.load()
        
        //Then
        
        //First Expected
        XCTAssertEqual(view.outputs.count, 3) //isloading 2 times, 1 moviePresentation
        
        //Second
        switch view.outputs.first {
        case .setLoading(let isLoading):
            if isLoading { break } else { XCTFail("First output should be true/isloading") }
        default:
            XCTFail("First output should be true/isloading")
        }
        
        //Third
        XCTAssertEqual(try view.outputs.element(at: 1), .setLoading(false))
        XCTAssertEqual(try view.outputs.element(at: 0), .setLoading(true))
        
        let expectedPhotos = [photo1, photo2].map({ PhotoPresentation(photo: $0) })
        XCTAssertEqual(try view.outputs.element(at: 2), .showPhotoList(expectedPhotos))
    }
}

private class MockView: PhotoListViewModelDelegate {
    
    var outputs: [PhotoListViewModelOutput] = []
    var detailRouteCalled: Bool = false
    
    func handleViewModelOutput(_ output: PhotoListViewModelOutput) {
        self.outputs.append(output)
    }
    
    func navigate(to route: PhotoListViewRoute) {
        switch route {
        case .detail:
            detailRouteCalled = true
        }
    }
}

class MockPhotosService: DataServiceProtocol {
    var photos: [Photo] = []
    internal func getPhotosFromService(page: Int, completion: @escaping (Result<PhotoResponse>) -> Void) {
        completion(.success(PhotoResponse(results: photos)))
    }
}

public extension Array {
    
    public struct IndexOutOfBoundsError: Error { }
    
    public func element(at index: Int) throws -> Element {
        guard index >= 0 && index < self.count else {
            throw IndexOutOfBoundsError()
        }
        return self[index]
    }
}
