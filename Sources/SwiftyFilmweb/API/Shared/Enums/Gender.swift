//
//  SwiftyFilmweb
//  Copyright (c) Łukasz Lech 2020
//  Licensed under the MIT license. See LICENSE file.
//
	

import Foundation

public enum Gender: Int {
    case female = 1
    case male = 2
    case other
    
    init(string: String?) {
        guard let string = string,
            let id = Int(string),
            let gender = Gender(rawValue: id) else {
                self = .other
                return
        }
        self = gender
    }
}
