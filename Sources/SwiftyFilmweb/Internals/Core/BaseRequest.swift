//
//  SwiftyFilmweb
//  Copyright (c) Łukasz Lech 2020
//  Licensed under the MIT license. See LICENSE file.
//
	

import Foundation
import Alamofire

class BaseRequest: URLRequestConvertible {
    private enum Constants {
        static let appId: String = "android"
        static let version: String = "2.8"
    }
    
    // MARK: - Public Properties
    var requestMethod: HTTPMethod = .get
    
    // MARK: - Private Properties
    private let method: String
    private let parameters: [Any]
    
    // MARK: - Initializers
    init(method: String, parameters: [Any]) {
        self.method = method
        self.parameters = parameters
    }
    
    // MARK: - Public Methods
    func asURLRequest() throws -> URLRequest {
        let url = try Config.apiURL.asURL()
        
        var request = URLRequest(url: url)
        request.method = requestMethod
        
        let signature = Signature(method: method, parameters: parameters)
        let parameters = RequestParameters(methods: signature.requestMethod(),
                                           appId: Constants.appId,
                                           version: Constants.version,
                                           signature: try signature.sign())
        
        let encoder = URLEncodedFormParameterEncoder(encoder: .init(alphabetizeKeyValuePairs: false,
                                                                    spaceEncoding: .plusReplaced),
                                                     destination: .queryString)
        request = try encoder.encode(parameters,
                                     into: request)

        return request
    }
}
