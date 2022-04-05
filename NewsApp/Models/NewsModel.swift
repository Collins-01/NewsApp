//
//  NewsModel.swift
//  NewsApp
//
//  Created by Oriakhi Collins on 4/5/22.
//

import Foundation



struct NewsResponse: Codable {
    let articles: [Article]
}


// MARK: - Article
struct Article: Codable, Identifiable {
    let id = UUID()
    let author: String?
    let url: String?
    let source, title, newsModelDescription: String?
    let image: String?
    let date: Date?

    enum CodingKeys: String, CodingKey {
        case author, url, source, title
        case newsModelDescription = "description"
        case image, date
    }
}


extension Article {
    static var dummyData: Article {
        .init(author: "Oriakhi Collins",
              url: "https://unsplash.com/", source: "16 Bits",
              title: "iOS Dev",
              newsModelDescription: "Just a loremipsum introduction to doings 101",
              image: "https://images.unsplash.com/photo-1648737119422-2680a7e39089?ixlib=rb-1.2.1&ixid=MnwxMjA3fDF8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1744&q=80",
              date: Date())
    }
}
