//
//  SwiftyFilmweb
//  Copyright (c) Łukasz Lech 2020
//  Licensed under the MIT license. See LICENSE file.
//

import Foundation

final class LiveSearch {
    private enum Constants {
        static let responseRecordSeparator = "\\c"
        static let responseRowSeparator = "\\a"
    }
    
    // MARK: - Private Properties
    private let api: NetworkingProtocol
    
    // MARK: - Initializers
    init(api: NetworkingProtocol = Networking()) {
        self.api = api
    }
    
    func search(query: String,
                success: (([LiveSearchItem]) -> ())?,
                failure: ((Error) -> ())?) {
        api.liveSearch(query: query,
                       success: LiveSearch.handleResponse(success: success,
                                                          failure: failure),
                       failure: failure)
    }
    
    // MARK: - Private Methods
    private static func handleResponse(success: (([LiveSearchItem]) -> ())?,
                                       failure: ((Error) -> ())?) -> ((String) -> ())? {
        let handler: ((String) -> ()) = { response in
            let rows = response.components(separatedBy: Constants.responseRowSeparator)
            let items = mapLiveSearchItems(rows)
            success?(items)
        }
        
        return handler
    }
    
    private static func mapLiveSearchItems(_ rows: [String]) -> [LiveSearchItem] {
        let items = rows.map { LiveSearchItem(response: $0.components(separatedBy: Constants.responseRecordSeparator)) }
        
        return []
    }
}
