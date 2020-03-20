//
//  SwiftyFilmweb
//  Copyright (c) Łukasz Lech 2020
//  Licensed under the MIT license. See LICENSE file.
//

public struct SwiftyFilmweb {
    public typealias LiveSearchSuccessHandler = (([LiveSearchItem]) -> ())
    public typealias LiveSearchErrorHandler = ((Error) -> ())
    
    // MARK: - Private Properties
    let liveSearch: LiveSearch = LiveSearch()
    
    // MARK: - Public Methods
    public func liveSearch(query: String,
                           success: LiveSearchSuccessHandler?,
                           failure: LiveSearchErrorHandler?) {
        liveSearch.search(query: query,
                          success: success,
                          failure: failure)
    }
}
