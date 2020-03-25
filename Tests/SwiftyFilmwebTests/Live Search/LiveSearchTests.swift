//
//  SwiftyFilmwebTests
//  Copyright (c) Łukasz Lech 2020
//  Licensed under the MIT license. See LICENSE file.
//
	

import XCTest

@testable import SwiftyFilmweb

class LiveSearchTests: XCTestCase {
    // MARK: - Subject under test
    var sut: LiveSearch!
        
    override func setUp() {
        sut = LiveSearch(api: NetworkingMock())
    }
    
    // MARK: - Tests
    func testLiveSearchResponseItemsCountMatchesExpectations() {
        // Given
        let expectedItems = 10
        let expectation = XCTestExpectation()
        
        // When
        sut.search(query: "karol", success: { items in
            XCTAssertEqual(items.count, expectedItems)
            expectation.fulfill()
        }) { error in
            XCTFail(error.localizedDescription)
        }
        
        // Then
        wait(for: [expectation], timeout: 1.0)
    }
    
    func testLiveSearchResponseItemsOfPersonTypeCountMatchesExpectations() {
        // Given
        let expectedItems = 8
        let expectation = XCTestExpectation()
        
        // When
        sut.search(query: "karol", success: { items in
            let people = items.compactMap { $0 as? LiveSearchPerson }
            XCTAssertEqual(people.count, expectedItems)
            expectation.fulfill()
        }) { error in
            XCTFail(error.localizedDescription)
        }
        
        // Then
        wait(for: [expectation], timeout: 1.0)
    }
    
    func testLiveSearchResponseItemsOfMovieTypeCountMatchesExpectations() {
        // Given
        let expectedMovieTypeItems = 3
        let expectedTvSeriesTypeItems = 1
        
        let expectation = XCTestExpectation()
        
        // When
        sut.search(query: "assassins", success: { items in
            let items = items.compactMap { $0 as? LiveSearchMovie }
            
            let movies = items.filter { $0.type == .film }
            XCTAssertEqual(movies.count, expectedMovieTypeItems)
            
            let series = items.filter { $0.type == .tvSeries }
            XCTAssertEqual(series.count, expectedTvSeriesTypeItems)
            
            XCTAssertEqual(items.count, expectedMovieTypeItems + expectedTvSeriesTypeItems)
            
            expectation.fulfill()
        }) { error in
            XCTFail(error.localizedDescription)
        }
        
        // Then
        wait(for: [expectation], timeout: 1.0)
    }
    
    func testLiveSearchResponseItemsOfCinemaTypeCountMatchesExpectations() {
        // Given
        let expectedItems = 9
        let expectation = XCTestExpectation()
        
        // When
        sut.search(query: "cinema city", success: { items in
            let cinemas = items.compactMap { $0 as? LiveSearchCinema }
            XCTAssertEqual(cinemas.count, expectedItems)
            expectation.fulfill()
        }) { error in
            XCTFail(error.localizedDescription)
        }
        
        // Then
        wait(for: [expectation], timeout: 1.0)
    }
  
    // Test commented out due to https://bugs.swift.org/browse/SR-11501
//    func testLiveSearchResponseItemsOtherThanCinemasHaveValidImageURLs() throws {
//        // Given
//        let randomQuery = try XCTUnwrap(NetworkingResponse.response.randomElement()?.key)
//        let expectation = XCTestExpectation()
//
//        // When
//        sut.search(query: randomQuery, success: { items in
//            let items = items.filter { $0.type != .cinema }
//            let urls = items.compactMap { $0.imageURL }
//            XCTAssertEqual(urls.count, items.count)
//            expectation.fulfill()
//        }) { error in
//            XCTFail(error.localizedDescription)
//        }
//
//        // Then
//        wait(for: [expectation], timeout: 1.0)
//    }
}
