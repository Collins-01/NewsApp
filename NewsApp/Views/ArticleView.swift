//
//  ArticleView.swift
//  NewsApp
//
//  Created by Oriakhi Collins on 4/5/22.
//

import SwiftUI
import URLImage

struct ArticleView: View {
    let article: Article
    var body: some View {
        HStack{
            if let image = article.image, let url = URL(string: image) {
                URLImage(url,
                         content: {image in
                            image.resizable()
                                .aspectRatio(contentMode: /*@START_MENU_TOKEN@*/.fill/*@END_MENU_TOKEN@*/).ignoresSafeArea()
                            
                         })
                    .frame(width: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, height: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                    .cornerRadius(10)
            }
            else{
                Image(systemName: "photo.fill")
                    .frame(width: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, height: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                    .background(Color.gray)
                    .foregroundColor(.white)
            }
            
            
            VStack(alignment: .leading, spacing: 10){
                Text(article.title ?? "")
                    .foregroundColor(.black)
                    .font(.system(size: 18, weight: .semibold))
                Text(article.source ?? "N/A")
                    .font(.footnote)
                    .foregroundColor(.gray)
            }
        }
    }
}



struct ArticleView_Previews: PreviewProvider {
    static var previews: some View {
        ArticleView(article: Article.dummyData)
            .previewLayout(.sizeThatFits)
    }
}
