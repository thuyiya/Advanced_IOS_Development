import UIKit

struct Course: Decodable {
    var id: Int?
    var name: String?
    var link: String?
    var imageUrl: String?
}

struct WebsiteDescription: Decodable {
    let name: String
    let description: String
    let courses: [Course]
}


class RestViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let jsonUrlString = "https://jsonplaceholder.typicode.com/posts"
        
        
        //        guard let url = URL(string: jsonUrlString) else { return }
        
        
        var paramsDictionary = [String:Any]()
        
        paramsDictionary["userId"] = 12312
        paramsDictionary["id"]    = 21412
        paramsDictionary["title"]    = "titie 1"
        paramsDictionary["body"]    = "body 1"
        
        HttpClientApi.instance().makeAPICall(url: jsonUrlString, params: paramsDictionary, method: .POST, success: { (data, response, error) in
            print("data loaded")
            
            guard let data = data else { return }
            
            do {
                let post = try JSONDecoder().decode(Post.self, from: data)
                
                print(post)
                
            } catch let jsonError {
                print("Decode Error ", jsonError)
            }
        }) { (data, response, error) in
            print("wrong api call", error)
        }
        
        
        
        
        
        //        URLSession.shared.dataTask(with: url) { (data, response, error) in
        //            // if erro
        //            // status 200
        //
        //            guard let data = data else { return }
        ////
        ////            let dataString = String(data: data, encoding: .utf8)
        //
        //            do {
        //                //swift 4 and above
        //                let courses = try JSONDecoder().decode([Course].self, from: data)
        //
        //                print(courses)
        //
        //
        //                //Swift 2/3/ObjectC
        //
        ////                guard let josn = try JSONSerialization.jsonObject(with: data, options: .mutableContainers) as? [String: Any] else { return }
        ////
        ////                let course = Course(json: josn)
        ////
        ////                print(course.id)
        ////                print(course.name)
        ////                print(course.imageUrl)
        //
        //            } catch let jsonError {
        //                print("Decode Error ", jsonError)
        //            }
        //
        //        }.resume()
        //
        //    }
        
    }
    
}
