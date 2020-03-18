//
//  SwiftyFilmwebTests
//  Copyright (c) Łukasz Lech 2020
//  Licensed under the MIT license. See LICENSE file.
//
	

import Foundation
import Alamofire

@testable import SwiftyFilmweb

final class NetworkingMock {
    // MARK: - Provate Properties
    private let responseString: String?
    private let error: Error?
    
    // MARK: - Initializers
    init(responseString: String? = nil,
         error: Error? = nil) {
        self.responseString = responseString
        self.error = error
    }
}

extension NetworkingMock: NetworkingProtocol {
    func liveSearch(query: String,
                    success: ((String) -> ())?,
                    failure: ((Error) -> ())?) {
        if let error = error {
            failure?(error)
        } else if let response = responseString {
            success?(response)
        }
    }
}
