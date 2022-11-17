import Foundation


//https://hacker-news.firebaseio.com/v0/topstories.json?print=pretty

struct TopStoriesRequest: RequestProtocol{
    var path: String{
        return "/v0/topstories.json?print=pretty"
    }
  
    var requestType: RequestType {
        .GET
    }
}
