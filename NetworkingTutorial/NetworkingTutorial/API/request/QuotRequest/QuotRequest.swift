//
//  QuotRequest.swift
//  NetworkingTutorial
//
//  Created by Rajkumar Yadav on 11/30/22.
//



import Foundation
//https://api.quotable.io/random

enum QuotRequest: RequestProtocol{
    case all
    
    var host: String {
        APIConstants.hostRandomQuot
    }
    
    var path: String{
        return "/random"
    }
  
   
    var requestType: RequestType {
        .GET
    }
    
   
}
