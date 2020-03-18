//
//  SwiftyFilmweb
//  Copyright (c) Łukasz Lech 2020
//  Licensed under the MIT license. See LICENSE file.
//

import Foundation

extension URL {
    static func imageURL(forType type: LiveSearchItemType, suffix: String?) -> URL? {
        guard let suffix = suffix,
            let prefix = type.iamgeURLPrefix else {
                return nil
        }
        return URL(string: prefix + suffix)
    }
}
