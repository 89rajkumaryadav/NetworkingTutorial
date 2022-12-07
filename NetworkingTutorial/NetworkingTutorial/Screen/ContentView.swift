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
            NewsListScreen()
                       .tabItem {
                           Label("News", systemImage: "list.dash")
                       }

            AlbumScreen()
                       .tabItem {
                           Label("Album", systemImage: "square.and.pencil")
                       }
            
            ImagesAndQuot()
                .tabItem {
                    Label("Random Images", systemImage: "doc.text.image")
                }
            
            
               }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}



















