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

/*
 {
   "by" : "dhouston",
   "descendants" : 71,
   "id" : 8863,
   "kids" : [ 8952, 9224, 8917, 8884, 8887, 8943, 8869, 8958, 9005, 9671, 8940, 9067, 8908, 9055, 8865, 8881, 8872, 8873, 8955, 10403, 8903, 8928, 9125, 8998, 8901, 8902, 8907, 8894, 8878, 8870, 8980, 8934, 8876 ],
   "score" : 111,
   "time" : 1175714200,
   "title" : "My YC app: Dropbox - Throw away your USB drive",
   "type" : "story",
   "url" : "http://www.getdropbox.com/u/2/screencast.html"
 }
 */


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
