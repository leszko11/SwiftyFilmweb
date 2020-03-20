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
    public let fullName: String
    public let gender: Gender
    public let profession: Profession
    
    // MARK: - Initializers
    override init?(response: [String]) {
        guard let fullName = response[safe: Constants.fullNameIndex] else {
            return nil
        }
        self.fullName = fullName
        self.gender = Gender(string: response[safe: Constants.genderIndex])
        self.profession = Profession(string: response[safe: Constants.genderIndex])
        
        super.init(response: response)
    }
}
