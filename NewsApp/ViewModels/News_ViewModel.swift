//
//  News_ViewModel.swift
//  NewsApp
//
//  Created by Oriakhi Collins on 4/5/22.
//

import Foundation
import Combine

protocol NewsViewModel {
    func  getArticles()
}


class NewsViewModelImpl: ObservableObject, NewsViewModel {
    
//    Dependency Injection
     private  let service: NewsService
    init(service: NewsService) {
        self.service = service
    }
    
    private(set) var articles = [Article]()
    private var cancellables = Set<AnyCancellable>()
    @Published private(set)  var state:ResultStates = .loading
    func getArticles() {
        self.state = .loading
        let cancellable = service.request(from: .getNews)
            .sink(receiveCompletion: {res in
                switch res {
                case .finished :
                    self.state = .success(contents: self.articles)
                case .failure(let error):
                    self.state = .failed(error: error)
                }
                
            }, receiveValue: {response in
                self.articles = response.articles
                
            })
        self.cancellables.insert(cancellable)
    }
    
    
}
