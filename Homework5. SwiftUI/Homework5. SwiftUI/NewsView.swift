//
//  NewsView.swift
//  Homework5. SwiftUI
//
//  Created by Максим Бобков on 31.01.2024.
//

import SwiftUI

struct NewsView: View {
    
    @State var news: [News] = []
    private var networkService = NetworkService()
    
    var body: some View {
        
        List(news) { news in
            VStack {
                Text(Helper.getDate(date: news.date))
                    .font(.body)
                    .fontWeight(.light)
                Text(news.title)
                    .font(.title)
                    .fontWeight(.heavy)
            }
        }
        .onAppear {
            networkService.getNews { (news) in
                self.news = news
            }
        }
    }
}
