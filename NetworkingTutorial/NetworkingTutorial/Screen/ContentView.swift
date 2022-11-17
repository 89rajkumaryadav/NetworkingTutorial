//
//  ContentView.swift
//  NetworkingTutorial
//
//  Created by Rajkumar Yadav on 11/15/22.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
                   NewsList()
                       .tabItem {
                           Label("News", systemImage: "list.dash")
                       }

                   SearchPage()
                       .tabItem {
                           Label("Order", systemImage: "square.and.pencil")
                       }
               }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}



















