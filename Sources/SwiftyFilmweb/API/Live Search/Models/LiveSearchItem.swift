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
        static let invalidId = -1
    }
    
    // MARK: - Public Properties
    public let type: LiveSearchItemType
    public let id: Int
    public let imageURL: URL?
    
    // MARK: - Internal Properties
    var isValid: Bool {
        return type != .unknown && id > 0
    }
    
    // MARK: - Initializers
    init(response: [String]) {
        self.type = LiveSearchItemType(typeString: response[safe: Constants.typeIndex])
        self.id = Int(response[safe: Constants.idIndex] ?? "") ?? Constants.invalidId
        self.imageURL = URL.imageURL(forType: type, suffix: response[safe: Constants.imageURLIndex])
    }
}
