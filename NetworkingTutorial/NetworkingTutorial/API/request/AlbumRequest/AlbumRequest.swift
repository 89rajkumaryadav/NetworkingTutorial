//
//  AlbumRequest.swift
//  NetworkingTutorial
//
//  Created by Rajkumar Yadav on 11/22/22.
//

import Foundation
//https://jsonplaceholder.typicode.com/albums/1

enum AlbumRequest: RequestProtocol{
    case all
    
    var host: String {
      APIConstants.hostAlbum
    }
    
    var path: String{
        return "/albums"
    }
  
   
    var requestType: RequestType {
        .GET
    }
    
   
}
