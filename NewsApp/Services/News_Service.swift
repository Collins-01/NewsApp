//
//  News_Service.swift
//  NewsApp
//
//  Created by Oriakhi Collins on 4/5/22.
//

import Foundation
import Combine



protocol NewsService {
    
    func request(from endPoint:NewsAPI) -> AnyPublisher<NewsResponse,APiError>
}



struct NewsServiceImpl: NewsService {
    func request(from endPoint: NewsAPI) -> AnyPublisher<NewsResponse, APiError> {
        return URLSession
            .shared
            .dataTaskPublisher(for: endPoint.urlRequest)
            .receive(on: DispatchQueue.main)
            .mapError{_ in APiError.unknown }
            .flatMap{ data, response -> AnyPublisher<NewsResponse, APiError> in
                guard let response =  response as? HTTPURLResponse else{
                    return Fail(error: APiError.unknown).eraseToAnyPublisher()
                }
                //True Block
                if(200...299).contains(response.statusCode) {
                    let jsonDecoder = JSONDecoder()
                    jsonDecoder.dateDecodingStrategy = .iso8601
                    return Just(data).decode(type: NewsResponse.self, decoder: jsonDecoder)
                        .mapError{ _ in APiError.decodingError }
                        .eraseToAnyPublisher()
                    
                }
                else{
                    
                    //handle error
                    return Fail(error: APiError.errorCode(response.statusCode)).eraseToAnyPublisher()
                }
            }
            .eraseToAnyPublisher()
    }
    
    
}
