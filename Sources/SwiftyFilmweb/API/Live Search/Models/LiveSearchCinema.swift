//
//  SwiftyFilmweb
//  Copyright (c) Łukasz Lech 2020
//  Licensed under the MIT license. See LICENSE file.
//
	

import Foundation
import CoreLocation

final public class LiveSearchCinema: LiveSearchItem {
    private enum Constants {
        static let nameIndex = 2
        static let cityIndex = 3
        static let streetIndex = 4
        static let coordinatesIndex = 5
    }
    
    // MARK: - Public Properties
    public let name: String
    public let city: String
    public let street: String
    public let location: CLLocationCoordinate2D
    
    // MARK: - Initializers
    override init?(response: [String]) {
        guard let name = response[safe: Constants.nameIndex],
            let city = response[safe: Constants.cityIndex],
            let street = response[safe: Constants.streetIndex],
            let location = CLLocationCoordinate2D(string: response[Constants.coordinatesIndex]) else {
            return nil
        }
        
        self.name = name
        self.city = city
        self.street = street
        self.location = location
        
        super.init(response: response)
    }
}

private extension CLLocationCoordinate2D {
    init?(string: String?) {
        guard let degrees = string?.components(separatedBy: ",").compactMap ({ CLLocationDegrees($0) }),
            let lat = degrees.first,
            let long = degrees.last else {
            return nil
        }
        self = CLLocationCoordinate2D(latitude: lat, longitude: long)
    }
}
