//
//  NewsListVM.swift
//  NetworkingTutorial
//
//  Created by Rajkumar Yadav on 11/17/22.
//

import Foundation


class NewsListVM{
    
    @Published var isLoading = false ;
    private let requestManager = RequestManager()

    
    
    
    func getNewsList() async {
        do{
            let topStories[Int] = try await requestManager.perform(TopStoriesRequest())
        } catch{
            
        }
       // requestManager.perform(TopStoriesRequest())
    }
    
    
    
}



/*

func fetchAnimals() async {
  do {
    let animalsContainer: AnimalsContainer = try await requestManager.perform(AnimalsRequest.getAnimalsWith(
      page: 1,
      latitude: nil,
      longitude: nil))
    let animals = animalsContainer.animals
    self.animals = animals
    await stopLoading()
  } catch {
  }
}


*/
