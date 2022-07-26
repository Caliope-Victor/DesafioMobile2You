//
//  ServiceTest.swift
//  DesafioMobile2YouTests
//
//  Created by Victor Henrique Caliope Soares on 25/07/22.
//

import XCTest
@testable import DesafioMobile2You

class ServiceTest: XCTestCase {

    var service: Services!
    
    override func setUpWithError() throws {
        service = MockService()
    }

    override func tearDownWithError() throws {
        service = nil
    }
    
    //MARK: testing getMovie
    
    // Test if decoding is working
    func testCanDecode() throws {
        service.getMovie(with: "MockMovie"){ result in
            switch result {
            case .success(let movie):
                XCTAssertNotNil(movie)
                XCTAssertEqual(movie.id, 616037)
            case .failure(let error):
                XCTAssertNil(error)
                
            }
        }
    }
    
    // Test if is not passing without a valid path
    func testEmptyData() throws {
        service.getMovie(with: "invalid path") { result in
            switch result {
            case .success(let movie):
                XCTAssertNil(movie)
            case .failure(let error):
                XCTAssertEqual(error, .dataIsEmpty)
            }
        }
    }

    // Test an path with invalid data
    func testDataNotLoad() throws{
        service.getMovie(with: "MockEmpty") { result in
            switch result {
            case .success(let movie):
                XCTAssertNil(movie)
            case .failure(let error):
                XCTAssertEqual(error, .dataNotLoaded)
            }
        }

    }
    
    //MARK: testing getSimilars
    
    // Test if decoding on getting similars is working
    func testSimilarsCanDecode() throws {
        service.getSimilars(with: "MockSimilars"){ result in
            switch result {
            case .success(let movie):
                XCTAssertNotNil(movie)
            case .failure(let error):
                XCTAssertNil(error)
                
            }
        }
    }
    
    // Test if is not passing without a valid path
    func testSimilarsEmptyData() throws {
        service.getSimilars(with: "invalid path") { result in
            switch result {
            case .success(let movie):
                XCTAssertNil(movie)
            case .failure(let error):
                XCTAssertEqual(error, .dataIsEmpty)
            }
        }
    }

    // Test an path with invalid data
    func testSimilarsDataNotLoad() throws{
        service.getSimilars(with: "MockEmpty") { result in
            switch result {
            case .success(let movie):
                XCTAssertNil(movie)
            case .failure(let error):
                XCTAssertEqual(error, .dataNotLoaded)
            }
        }

    }
}
