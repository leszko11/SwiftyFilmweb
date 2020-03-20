//
//  SwiftyFilmwebTests
//  Copyright (c) Łukasz Lech 2020
//  Licensed under the MIT license. See LICENSE file.
//
	

import Foundation
import Alamofire

@testable import SwiftyFilmweb

final class NetworkingMock {
    enum NetworkingMockError: Error {
        case noResponse
    }
    
    // MARK: - Initializers
    init() { }
}

extension NetworkingMock: NetworkingProtocol {
    func liveSearch(query: String,
                    success: ((String) -> ())?,
                    failure: ((Error) -> ())?) {
  
        if let response = NetworkingResponse.response[query] {
            success?(response)
        } else {
            failure?(NetworkingMockError.noResponse)
        }
    }
}
