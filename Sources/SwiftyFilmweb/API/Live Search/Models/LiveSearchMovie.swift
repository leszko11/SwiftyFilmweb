//
//  SwiftyFilmweb
//  Copyright (c) Łukasz Lech 2020
//  Licensed under the MIT license. See LICENSE file.
//
	

import Foundation

final public class LiveSearchMovie: LiveSearchItem {
    private enum Constants {
        static let titleIndex = 3
        static let polishTitleIndex = 4
        static let otherTitleIndex = 5
        static let yearIndex = 6
        static let castIndex = 7
    }
    
    // MARK: - Public Properties
    public let title: String
    public let year: String
    
    public let polishTitle: String?
    public let otherTitle: String?
    public let cast: String?
    
    // MARK: - Initializers
    override init?(response: [String]) {
        guard let title = response[safe: Constants.titleIndex],
            let year = response[safe: Constants.yearIndex] else {
            return nil
        }
        self.title = title
        self.year = year
        
        self.polishTitle = response[safe: Constants.polishTitleIndex]
        self.otherTitle = response[safe: Constants.otherTitleIndex]
        self.cast = response[safe: Constants.castIndex]
        
        super.init(response: response)
    }
}

