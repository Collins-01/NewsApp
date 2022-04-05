//
//  News_EndPoint.swift
//  NewsApp
//
//  Created by Oriakhi Collins on 4/5/22.
//

import Foundation


protocol ApiBuilder {
    var urlRequest: URLRequest {get}
    var baseUrl: URL{get}
    var path: String{get}
}


enum NewsAPI {
    case getNews
}


extension NewsAPI:ApiBuilder{
    var urlRequest: URLRequest {
        return URLRequest(url: self.baseUrl.appendingPathComponent(self.path))
    }
    
    var baseUrl: URL {
        switch self {
        case .getNews:
            return URL(string: "https://api.lil.software")!
//        default:
            
        }
    }
    
    var path: String {
        return "/news"
    }
    
    
}
//https://api.lil.software/
