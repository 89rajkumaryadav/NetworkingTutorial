import Foundation


//https://hacker-news.firebaseio.com/v0/topstories.json?print=pretty

enum TopStoriesRequest: RequestProtocol{
    case all
    
    var path: String{
        return "/v0/topstories.json"
    }
  
    var urlParams: [String : String?]{
        ["print":"pretty"]
    }
    var requestType: RequestType {
        .GET
    }
    
   
}

//https://hacker-news.firebaseio.com/v0/item/8863.json?print=pretty

enum StoryDetailRequest: RequestProtocol{
    
    case getStoryByID(id:Int)
    
    var path: String {
        let path = "/v0/item/"
        switch self {
        case let .getStoryByID(id):
            return path + "\(id)" + ".json"
            
        }
        
    }
    
    var urlParams: [String : String?]{
        ["print":"pretty"]
    }
    var requestType: RequestType{ .GET }
    
    
}
