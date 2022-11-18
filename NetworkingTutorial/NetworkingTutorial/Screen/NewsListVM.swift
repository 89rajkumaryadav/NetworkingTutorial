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
            isLoading = true
            let request = TopStoriesRequest.all
            let topStories:[Int] = try await requestManager.perform(request)
            print(topStories)
            if !topStories.isEmpty {
                
            }
            await stopLoading()
        } catch{
            
        }
       
    }
    
    
    @MainActor
    func stopLoading() async{
        isLoading = false ;
    }
    
}


