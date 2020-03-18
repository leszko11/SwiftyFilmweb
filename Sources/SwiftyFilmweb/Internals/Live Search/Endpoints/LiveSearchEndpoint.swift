//
//  SwiftyFilmweb
//  Copyright (c) Łukasz Lech 2020
//  Licensed under the MIT license. See LICENSE file.
//
	

import Foundation
import Alamofire

struct LiveSearchEndpoint {
    // MARK: - Private Properties
    private let query: String
    
    // MARK: Initializers
    init(query: String) {
        self.query = query
    }
}

extension LiveSearchEndpoint: URLRequestConvertible {
    func asURLRequest() throws -> URLRequest {
        let url = try "https://www.filmweb.pl/search/live".asURL()
        
        var request = URLRequest(url: url)
        request.method = .get
        
        let parameters = ["query": query]
        request = try URLEncoding.queryString.encode(request, with: parameters)
        
        return request
    }
}
