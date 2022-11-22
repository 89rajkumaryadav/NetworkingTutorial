//
//  AlbumScreenVM.swift
//  NetworkingTutorial
//
//  Created by Rajkumar Yadav on 11/22/22.
//

import Foundation


class AlbumScreenListVM: ObservableObject {
    @Published var isLoading = false;
    @Published var allAlbum: [AlbumScreenVM] = [];
    
    private let requestManager:RequestManager

    init() {
       requestManager = RequestManager()
    }
    
    @MainActor
    func getAlbumList() async{
       
        do{
            isLoading = true
            let request = AlbumRequest.all
            let albumList: [AlbumModel] = try await requestManager.perform(request)
         
            if !albumList.isEmpty{
                allAlbum = albumList.map(AlbumScreenVM.init) ;
            }
            
            await stopLoading()
        }catch{
            print(error.localizedDescription)
        }
    }
    
    @MainActor
    func stopLoading() async{
        isLoading = false ;
    }
    
}


struct AlbumScreenVM: Identifiable {
    let id = UUID()
    
    let album:AlbumModel
    
    var title: String{
        album.title ?? "N/A"
    }
}
