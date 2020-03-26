//
//  SwiftyFilmweb
//  Copyright (c) Łukasz Lech 2020
//  Licensed under the MIT license. See LICENSE file.
//
	

import Foundation
import CryptoKit

final class Signature {
    private enum Constants {
        static let apiKey = "qjcGhW2JnvGT9dfCt3uT_jozR3s"
        static let version = "android"
    }
    
    enum SignatureError: Error {
        case unableToEncodeParameters(parameters: [Any])
    }
    
    // MARK: - Private Properties
    private let method: String
    private let parameters: [Any]
    
    // MARK: - Initializers
    init(method: String,
         parameters: [Any]) {
        self.method = method
        self.parameters = parameters
    }
    
    // MARK: - Public Methods
    func requestMethod() -> String {
        let parameters = prepareParameters()
        return "\(method) \(parameters)"
    }
    
    func sign() throws -> String {
        let parameters = prepareParameters()
        let string = "\(method) \(parameters)\(Constants.version)\(Constants.apiKey)"
        guard let data = string.data(using: .utf8) else {
            throw SignatureError.unableToEncodeParameters(parameters: self.parameters)
        }
        let hash = Insecure.MD5.hash(data: data).map { String(format: "%02hhx", $0) }.joined()
        
        return "1.0," + hash
    }
    
    // MARK: - Private Methods
    private func prepareParameters() -> String {
        guard !parameters.isEmpty else {
            return "[-1]\n"
        }
        let values = parameters.map { "\($0)" }.joined(separator: ", ")
        return "[" + values + "]\n"
    }
}
