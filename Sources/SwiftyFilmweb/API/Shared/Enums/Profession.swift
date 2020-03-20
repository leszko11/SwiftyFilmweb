//
//  SwiftyFilmweb
//  Copyright (c) Łukasz Lech 2020
//  Licensed under the MIT license. See LICENSE file.
//
    

import Foundation

public enum Profession {
    case director
    case screenwriter
    case cinematography
    case music
    case scenography
    case actor
    case producer
    case montage
    case costumeDesign
    case originalMaterials
    case sound
    case archivalMaterials
    case voice
    case inPerson
    case other
    
    init(string: String?) {
        self = Profession.liveSearchProfession(forID: string)
    }
    
    private static func liveSearchProfession(forID string: String?) -> Profession {
        guard let string = string,
            let id = Int(string) else {
                return .other
        }
        
        switch id {
        case 1:
            return .director
        case 2:
            return .screenwriter
        case 3:
            return .cinematography
        case 4:
            return .music
        case 5:
            return .scenography
        case 6:
            return .actor
        case 7:
            return .producer
        case 10:
            return .montage
        case 12:
            return .costumeDesign
        case 17:
            return .originalMaterials
        case 18:
            return .sound
        case 19:
            return .archivalMaterials
        case 20:
            return .voice
        case 21:
            return .inPerson
        default:
            return .other
        }
    }
}

///Live Search
//case director = 1
//case screenwriter = 2
//case cinematography = 3
//case music = 4
//case scenography = 5
//case actor = 6
//case producer = 7
//case montage = 10
//case costumeDesign = 12
//case originalMaterials = 17
//case sound = 18
//case archivalMaterials = 19
//case voice = 20
//case inPerson = 21
//case other

///Regular
//case director = 1
//case screenwriter = 2
//case music = 3
//case cinematography = 4
//case originalMaterials = 5
//case actor = 6
//case producer = 9
//case montage = 10
//case costumeDesign = 11
//case archivalMaterials = 12

//case scenography = 5
//case sound = 18
//case voice = 20
//case inPerson = 21
//case other
