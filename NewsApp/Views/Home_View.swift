//
//  Home_View.swift
//  NewsApp
//
//  Created by Oriakhi Collins on 4/5/22.
//

import SwiftUI

struct Home_View: View {
   @StateObject var viewModel = NewsViewModelImpl(service: NewsServiceImpl())
    var body: some View {
        Group{
        
            
        }
        .onAppear(perform: viewModel.getArticles)
        
        
            
    }
    
}

struct Home_View_Previews: PreviewProvider {
    static var previews: some View {
        Home_View()
    }
}
