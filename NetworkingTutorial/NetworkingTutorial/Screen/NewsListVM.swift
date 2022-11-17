//
//  NewsListVM.swift
//  NetworkingTutorial
//
//  Created by Rajkumar Yadav on 11/17/22.
//

import Foundation


class NewsListVM{
    
    @Published var isLoading = false ;
    private let requestManager:RequestManager = RequestManager()

    
    
    
    func getNewsList() async {
        do{
            let topStories:[Int] = try await requestManager.perform(TopStoriesRequest())
            print(topStories)
        } catch{
            
        }
       // requestManager.perform(TopStoriesRequest())
    }
    
    
    @MainActor
    func stopLoading() async{
        isLoading = false ;
    }
    
}


