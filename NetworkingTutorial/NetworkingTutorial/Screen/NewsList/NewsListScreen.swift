//
//  NewsList.swift
//  NetworkingTutorial
//
//  Created by Rajkumar Yadav on 11/17/22.
//

import Foundation

import SwiftUI

struct NewsListScreen: View {
  @ObservedObject  var  newsVM = NewsListVM()
    var body: some View {
        VStack{
            List{
                ForEach(newsVM.allTopStories) { story in
                    Text(story.title).padding()
                }
            }
        
        }.overlay{
            if newsVM.isLoading {
              ProgressView("Loading stories...")
            }
        }
        .onAppear(){
        
            Task{
                await newsVM.getNewsList()
            }
           
        }
    }
}




struct NewsListScreen_Previews: PreviewProvider {
    static var previews: some View {
        NewsListScreen()
    }
}








