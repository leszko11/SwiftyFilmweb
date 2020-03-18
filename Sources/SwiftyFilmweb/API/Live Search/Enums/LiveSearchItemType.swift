//
//  SwiftyFilmweb
//  Copyright (c) Łukasz Lech 2020
//  Licensed under the MIT license. See LICENSE file.
//

import Foundation

public enum LiveSearchItemType: String {
    case cinema = "c"
    case film = "f"
    case game = "g"
    case person = "p"
    case tvSeries = "s"
    case unknown
    
    init(typeString: String?) {
        switch typeString {
        case "c":
            self = .cinema
        case "f":
            self = .film
        case "g":
            self = .game
        case "p":
            self = .person
        case "s":
            self = .tvSeries
        default:
            self = .unknown
        }
    }

    var iamgeURLPrefix: String? {
        switch self {
        case .film, .game, .tvSeries:
            return Config.posterImageURL
        case .person:
            return Config.personImageURL
        default:
            return nil
        }
    }
}
