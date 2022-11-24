//
//  NewsListVM.swift
//  NetworkingTutorial
//
//  Created by Rajkumar Yadav on 11/17/22.
//

import Foundation

@MainActor
class NewsListVM: ObservableObject{
    
    @Published var isLoading = false ;
    @Published var allTopStories: [NewsVM] = [] ;
    private let requestManager:RequestManager

    init() {
       requestManager = RequestManager()
    }
    
   
    func getNewsList() async {
        do{
            var allStories: [TostoriesModel] = [] ;
          //  allTopStories = [] ;
            isLoading = true
            let request = TopStoriesRequest.all
            let topStories:[Int] = try await requestManager.perform(request)
            print(topStories)
            if !topStories.isEmpty {
              // Using task group to download apis concurrently
                try await withThrowingTaskGroup(of: TostoriesModel.self, body: { group in
                    
                    for id in topStories.prefix(10){
                        group.addTask {
                            let request = StoryDetailRequest.getStoryByID(id: id)
                            let storyDetails: TostoriesModel = try await self.requestManager.perform(request)
                            return storyDetails
                        }
                    }
                    
                     for try await details in group{
                         allStories.append(details)
                     }
                    
                })
                
            }
           
            
            allTopStories =  allStories.map(NewsVM.init) ;
          
            print(allTopStories)
            await stopLoading()
        } catch let error{
            print(error)
        }
       
    }
    
    
  
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

