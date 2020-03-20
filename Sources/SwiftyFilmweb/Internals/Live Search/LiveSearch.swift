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
                success: SwiftyFilmweb.LiveSearchSuccessHandler?,
                failure: SwiftyFilmweb.LiveSearchErrorHandler?) {
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
        let items = rows.map { row -> LiveSearchItem? in
            let row = row.components(separatedBy: Constants.responseRecordSeparator)
            guard let item = LiveSearchItem(response: row) else {
                return nil
            }
            
            switch item.type {
            case .person:
                return LiveSearchPerson(response: row)
            case .film, .tvSeries:
                return LiveSearchMovie(response: row)
            case .cinema:
                return LiveSearchCinema(response: row)
            default:
                return item
            }
        }
        
        return items.compactMap { $0 }
    }
}
