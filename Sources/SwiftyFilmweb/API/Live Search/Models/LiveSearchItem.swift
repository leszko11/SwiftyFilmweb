//
//  SwiftyFilmweb
//  Copyright (c) Łukasz Lech 2020
//  Licensed under the MIT license. See LICENSE file.
//

import Foundation

public class LiveSearchItem {
    private enum Constants {
        static let typeIndex = 0
        static let idIndex = 1
        static let imageURLIndex = 2
    }
    
    // MARK: - Public Properties
    public let type: LiveSearchItemType
    public let id: Int
    public let imageURL: URL?
    
    // MARK: - Initializers
    init?(response: [String]) {
        guard let idString = response[safe: Constants.idIndex],
            let id = Int(idString) else {
            return nil
        }
        
        self.type = LiveSearchItemType(typeString: response[safe: Constants.typeIndex])
        self.id = id
        self.imageURL = URL.imageURL(forType: type, suffix: response[safe: Constants.imageURLIndex])
    }
}
