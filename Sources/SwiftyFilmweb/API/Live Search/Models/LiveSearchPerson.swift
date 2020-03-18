//
//  SwiftyFilmweb
//  Copyright (c) Łukasz Lech 2020
//  Licensed under the MIT license. See LICENSE file.
//
	

import Foundation

final public class LiveSearchPerson: LiveSearchItem {
    private enum Constants {
        static let fullNameIndex = 3
        static let genderIndex = 4
        static let professionIndex = 5
    }
    
    // MARK: - Public Properties
    let fullName: String
    let gender: Gender
    let profession: Profession
    
    // MARK: - Initializers
    override init(response: [String]) {
        self.fullName = response[safe: Constants.fullNameIndex] ?? ""
        self.gender = Gender(string: response[safe: Constants.genderIndex])
        self.profession = Profession(string: response[safe: Constants.genderIndex])
        
        super.init(response: response)
    }
}
