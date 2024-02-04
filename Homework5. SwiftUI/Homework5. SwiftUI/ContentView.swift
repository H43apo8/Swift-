//
//  ContentView.swift
//  Homework5. SwiftUI
//
//  Created by Максим Бобков on 27.01.2024.
//

import SwiftUI

struct ContentView: View {
    
    var body: some View {
     
        NavigationStack {
            NavigationLink("News", destination: {
                NewsView()
            }).navigationTitle("Start Page")
        }
    }
}
