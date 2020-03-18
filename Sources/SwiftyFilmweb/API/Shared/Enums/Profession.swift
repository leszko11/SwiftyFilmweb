//
//  SwiftyFilmweb
//  Copyright (c) Łukasz Lech 2020
//  Licensed under the MIT license. See LICENSE file.
//
	

import Foundation

public enum Profession: Int {
    case director = 1
    case screenwriter = 2
    case cinematography = 3
    case music = 4
    case scenography = 5
    case actor = 6
    case producer = 7
    case montage = 10
    case costumeDesign = 12
    case originalMaterials = 17
    case sound = 18
    case voice = 20
    case inPerson = 21
    case other
    
    init(string: String?) {
        guard let string = string,
            let id = Int(string),
            let profession = Profession(rawValue: id) else {
                self = .other
                return
        }
        self = profession
    }
}
