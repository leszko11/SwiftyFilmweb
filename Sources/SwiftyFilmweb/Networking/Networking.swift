//
//  SwiftyFilmweb
//  Copyright (c) Łukasz Lech 2020
//  Licensed under the MIT license. See LICENSE file.
//
	

import Foundation
import Alamofire

protocol NetworkingProtocol: AnyObject {
    func liveSearch(query: String,
                    success: ((String) -> ())?,
                    failure: ((Error) -> ())?)
}

final class Networking {
    // MARK: - Private Properties
    private lazy var liveSearchSession: Session = {
        return Session()
    }()
}

extension Networking: NetworkingProtocol {
    func liveSearch(query: String,
                    success: ((String) -> ())?,
                    failure: ((Error) -> ())?) {
        let dataRequest = liveSearchSession.request(LiveSearchEndpoint(query: query))
        dataRequest
            .validate()
            .responseString { response in
                switch response.result {
                case let .success(response):
                    success?(response)
                case let .failure(error):
                    failure?(error)
                }
            }
    }
}
