//
//  ImagesAndQuotListVM.swift
//  NetworkingTutorial
//
//  Created by Rajkumar Yadav on 11/30/22.
//

import Foundation


class ImagesAndQuotListVM: ObservableObject {
    
    private let requestManager:RequestManager
   @Published var randomImages:[ImagesAndQuotCellVM] = [] ;

    init() {
       requestManager = RequestManager()
    }
    
    @MainActor
    func getRandomImages(ids: [Int]) async {
        
       
        
        // get image in serial way
       /* for id in ids {
            let randomImage = try await getRandomImage(id: id)
            randomImages.append(randomImage)
        } */
        
        do{
            // Get image in concurrent way
            try await withThrowingTaskGroup(of: (Int, RandomImage).self, body: { group in
                
                for id in ids {
                    group.addTask {
                        return (id, try await self.getRandomImage(id: id))
                    }
                }
                
                
                for try await (_, randomImage) in group {
                    print(randomImage)
                    randomImages.append(ImagesAndQuotCellVM(randomImages: randomImage))
                }
                
                debugPrint(randomImages.debugDescription)
                
            })
        }catch let error {
            print(error)
        }
       
        
        
    }
    
   private func getRandomImage(id: Int) async throws -> RandomImage {
        
        let imgRequest  = RandImgRequest.all
        let quotRequest = QuotRequest.all
        // Get image and quote in concurrent way
        async let imgData = await self.requestManager.performData(imgRequest)
        async let quote:Quote   = await self.requestManager.perform(quotRequest)
       
       // Some time it is blocking the API 
       var quotePersed:Quote?
       do {
           quotePersed =  try await quote
       }catch{
           quotePersed = Quote(content: "N/A")
       }
     
       
       return RandomImage(image: try await imgData, quote:quotePersed!)
  
    }
    
    
}

























