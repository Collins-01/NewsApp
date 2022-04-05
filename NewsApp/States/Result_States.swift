//
//  Result_States.swift
//  NewsApp
//
//  Created by Oriakhi Collins on 4/5/22.
//

import Foundation


enum ResultStates {
    case loading
    case success(contents: [Article])
    case failed(error: Error)
}
