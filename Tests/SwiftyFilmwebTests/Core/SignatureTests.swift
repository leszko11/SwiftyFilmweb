//
//  SwiftyFilmwebTests
//  Copyright (c) Łukasz Lech 2020
//  Licensed under the MIT license. See LICENSE file.
//
	

import XCTest

@testable import SwiftyFilmweb

class SignatureTests: XCTestCase {
    // MARK: - Subject under test
    var sut: Signature!
    
    // MARK: - Tests
    func testSignatureRequestMethodWithEmptyParameters() {
        // Given
        let method = UUID().uuidString
        let parameters: [Any] = []
        
        sut = Signature(method: method, parameters: parameters)
        
        // When
        let requestMethod = sut.requestMethod()
        
        // Then
        XCTAssertEqual(requestMethod, "\(method) [-1]\n")
    }
    
    func testSignatureRequestMethodWithParameters() {
        // Given
        let method = UUID().uuidString
        let parameters: [Any] = [UUID().uuidString, Int.random(in: (0...100))]
        
        sut = Signature(method: method, parameters: parameters)
        
        // When
        let requestMethod = sut.requestMethod()
        
        // Then
        XCTAssertEqual(requestMethod, "\(method) [\(parameters.first!), \(parameters.last!)]\n")
    }
    
    func testSignatureSignMethodWithParameters() {
        // Given
        let method = "getFilmPersons"
        let parameters: [Any] = [810167, 12, 0, 50]
        
        sut = Signature(method: method, parameters: parameters)
        
        // When
        let signature = try! sut.sign()
        
        // Then
        XCTAssertEqual(signature, "1.0,4e1d8d26fd3658b3236e18daa6a469d9")
    }
}
