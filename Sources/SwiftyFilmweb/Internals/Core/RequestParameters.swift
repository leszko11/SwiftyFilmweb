//
//  SwiftyFilmweb
//  Copyright (c) Łukasz Lech 2020
//  Licensed under the MIT license. See LICENSE file.
//
	

import Foundation

struct RequestParameters: Encodable {
    let methods: String
    let appId: String
    let version: String
    let signature: String
}
