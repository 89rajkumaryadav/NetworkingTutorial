//
//  RandImgRequest.swift
//  NetworkingTutorial
//
//  Created by Rajkumar Yadav on 11/30/22.
//


import Foundation
//https://picsum.photos/200/300?uuid=\(UUID().uuidString)
enum RandImgRequest: RequestProtocol{
    case all
    
    var host: String {
      APIConstants.hostRandomImage
    }
    
    var path: String{
        return "/200/300"
    }
  
    var urlParams: [String : String?]{
        ["uuid":UUID().uuidString]
    }
   
    var requestType: RequestType {
        .GET
    }
    
   
}
