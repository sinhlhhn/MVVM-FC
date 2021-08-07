//
//  GitHubAPI_MVVM_FCTests.swift
//  GitHubAPI-MVVM-FCTests
//
//  Created by Lê Hoàng Sinh on 9/9/20.
//  Copyright © 2020 Lê Hoàng Sinh. All rights reserved.
//

import XCTest
@testable import GitHubAPI_MVVM_FC

class MockupMainViewModel: MainViewModelType {
    
    
    var swapi: ResponseAPI!
    
    var flowController: MainFlowController!
    
    var requestClosure: ((Bool) -> Void)?
    
    var itemResults: [Item] = [Item]()
    
    var ownerResults: [Owner] = [Owner]()
    
    func getDatas(key: String) {
        if key != "" {
            requestClosure!(true)
        }
        
    }
    func selected(url: String) {
        print("selected")
    }
}

class GitHubAPI_MVVM_FCTests: XCTestCase {
    
    var sut: URLSession!

        
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        super.setUp()
        sut = URLSession(configuration: .default)
        
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        sut = nil
        super.tearDown()
    }

    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        measure {
            // Put the code you want to measure the time of here.
        }
    }
    
    func testDataBinding() {
        let viewModel = MockupMainViewModel()
        
        let viewController = MainViewController(viewModel: viewModel)
        
        _ = viewController.view
        let key = "work"
        viewModel.getDatas(key: key)
        
        let expectation = self.expectation(description: "test data binding")
        if key == "" {
            
        }else {
            expectation.fulfill()
        }
        
        wait(for: [expectation], timeout: 5)
        
        XCTAssert(viewController.t == true)
    }
    
    func testGetDatas() {
        
        let promise = expectation(description: "Status code is 200")
        
        let url = URL(string: "https://api.github.com/search/repositories?q=work")
        var err: Error?
        var res: Int?
        var data: Data?
        sut.dataTask(with: url!) { (dataResponse, response, error) in
            err = error
            res = (response as? HTTPURLResponse)?.statusCode
            data = dataResponse
            promise.fulfill()
        }.resume()
        
        wait(for: [promise], timeout: 5)
        
        
        XCTAssertNil(err)
        XCTAssert(res == 200)
        XCTAssert(data != nil)
        
    }

}
