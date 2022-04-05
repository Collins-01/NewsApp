//
//  Api_Error.swift
//  NewsApp
//
//  Created by Oriakhi Collins on 4/5/22.
//

import Foundation


enum APiError: Error {
    case decodingError
    case unknown
    case errorCode(Int)
}


extension APiError: LocalizedError{
    var errorDescription: String? {
        switch self {
        case .decodingError: return "An Error Occured whild Decoding Data"
        case .unknown: return "Unknown Error"
        case .errorCode (let code) : return "Error Code \(code) : - Something went wrong"
    
        }
    }
}
