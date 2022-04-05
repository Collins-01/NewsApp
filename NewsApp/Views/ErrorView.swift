//
//  ErrorView.swift
//  NewsApp
//
//  Created by Oriakhi Collins on 4/5/22.
//

import SwiftUI

struct ErrorView: View {
    
    typealias ErrorViewActionHandler = () -> Void
    let error: Error
    let handler: ErrorViewActionHandler
    internal init(error: Error, handler: @escaping ErrorView.ErrorViewActionHandler) {
        self.error = error
        self.handler =  handler
    }
    
    var body: some View {
        VStack{
            Image(systemName: "exclamationmark.icloud.fill")
                .foregroundColor(.gray)
                .font(.system(size: 50, weight: .heavy))
                .padding(.bottom, 4)
            
            Text("Ooooops")
                .font(.system(size: 30, weight: .heavy))
            Text(error.localizedDescription)
                .font(.system(size: 15 ))
                .multilineTextAlignment(.center)
                .padding(4)
            
            
            Button(action: {
                handler()
            } , label: {
                Text("Retry")
                
            })
            .padding(.vertical, 12)
            .padding(.horizontal, 30)
            .foregroundColor(.white)
            .background(Color.blue)
            .cornerRadius(10)
            .font(.system(size: 15, weight: .heavy))
        }
    }
}

struct ErrorView_Previews: PreviewProvider {
    static var previews: some View {
        ErrorView(error: APiError.decodingError){}
        
    }
}
