//
//  SwiftyFilmwebTests
//  Copyright (c) Łukasz Lech 2020
//  Licensed under the MIT license. See LICENSE file.
//
	

import XCTest

@testable import SwiftyFilmweb

class SwiftyFilmwebTests: XCTestCase {
    // MARK: - Subject under test
    var sut: LiveSearch!
        
    override func setUp() {
        sut = LiveSearch(api: NetworkingMock(responseString: responseString))
    }
    
    // MARK: - Tests
    func testLiveSearchResponseItemsCount() {
        // Given
        let expectedItems = 10
        let expectation = XCTestExpectation()
        
        // When
        sut.search(query: "", success: { items in
            XCTAssertEqual(items.count, expectedItems)
            expectation.fulfill()
        }) { error in
            XCTFail(error.localizedDescription)
        }
        
        // Then
        wait(for: [expectation], timeout: 1.0)
    }
}

extension SwiftyFilmwebTests {
    var responseString: String {
        "p\\c4289\\c/42/89/4289/344485_1.2.jpg\\cKarolina Gruszka\\c1\\c6\\c\\ap\\c8883\\c/88/83/8883/391000.2.jpg\\cKarol Strasburger\\c2\\c6\\c\\ap\\c739768\\c/97/68/739768/366852.2.jpg\\cKarolina Gorczyca\\c1\\c6\\c\\af\\c149809\\c/98/09/149809/7536866.6.jpg\\cKarol, un uomo diventato papa\\cKarol - człowiek, który został papieżem\\cKarol\\c2005\\cPiotr Adamczyk, Małgorzata Bela\\ap\\c127130\\c/71/30/127130/63989.2.jpg\\cKarol Wróblewski\\c2\\c20\\c\\ap\\c547232\\c/72/32/547232/362182.2.jpg\\cKarolina Piechota\\c1\\c6\\c\\ap\\c473\\c/04/73/473/358500.2.jpg\\cKarolina Rosińska\\c1\\c6\\c\\ap\\c1981403\\c/14/03/1981403/427861.2.jpg\\cKarolina Staniec\\c1\\c6\\c\\ap\\c857439\\c/74/39/857439/367878.2.jpg\\cKarolina Chapko\\c1\\c6\\c\\af\\c249570\\c/95/70/249570/7518087.6.jpg\\cKarol, un Papa rimasto uomo\\cKarol - papież, który pozostał człowiekiem\\cKarol - Papst und Mensch\\c2006\\cPiotr Adamczyk"
    }
}
