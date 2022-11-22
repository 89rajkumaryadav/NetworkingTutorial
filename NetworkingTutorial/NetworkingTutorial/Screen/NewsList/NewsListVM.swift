//
//  NewsListVM.swift
//  NetworkingTutorial
//
//  Created by Rajkumar Yadav on 11/17/22.
//

import Foundation


class NewsListVM: ObservableObject{
    
    @Published var isLoading = false ;
    @Published var allTopStories: [NewsVM] = [] ;
    private let requestManager:RequestManager

    init() {
       requestManager = RequestManager()
    }
    
    @MainActor
    func getNewsList() async {
        do{
            var allStories: [TostoriesModel] = [] ;
          //  allTopStories = [] ;
            isLoading = true
            let request = TopStoriesRequest.all
            let topStories:[Int] = try await requestManager.perform(request)
            print(topStories)
            if !topStories.isEmpty {
                
                for id in topStories.prefix(10){
                    let request = StoryDetailRequest.getStoryByID(id: id)
                    let storyDetails: TostoriesModel = try await requestManager.perform(request)
                    allStories.append(storyDetails)
                   // allTopStories.append(storyDetails)
                   // print(storyDetails)
                }
            }
           
            
            allTopStories =  allStories.map(NewsVM.init) ;
          
            print(allTopStories)
            await stopLoading()
        } catch let error{
            print(error)
        }
       
    }
    
    
    @MainActor
    func stopLoading() async{
        isLoading = false ;
    }
    
}



struct NewsVM: Identifiable {
    let id = UUID()
    
    let story:TostoriesModel
    
    var title: String{
        story.title ?? "N/A"
    }
}

