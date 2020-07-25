//
//  ViewController.swift
//  restapi
//
//  Created by thusitha on 7/25/20.
//  Copyright © 2020 nibm. All rights reserved.
//

import UIKit

struct Course: Decodable {
    let id: Int
    let name: String
    let link: String
    let imageUrl: String
    
    init(json: [String: Any]) {
        id = json["id"] as? Int ?? -1
        name = json["name"] as? String ?? ""
        link = json["link"] as? String ?? ""
        imageUrl = json["imageUrl"] as? String ?? ""
        
    }
}

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let jsonUrlString = "https://api.letsbuildthatapp.com/jsondecodable/course"
        guard let url = URL(string: jsonUrlString) else { return } //optional binding
        
        URLSession.shared.dataTask(with: url) { (data, response, err) in
            //check err
            //check respose status is 200 (success)
            
//            print("do something")
            
            guard let data = data else { return }
            
            let dataString = String(data: data, encoding: .utf8)
            
//            print(dataString)
            
            do {
                //swift 4 and above
                let course = try JSONDecoder().decode(Course.self, from: data)
                print(course.name)
                
                //Swift 2/3/ObjectC
//                guard let json = try JSONSerialization.jsonObject(with: data, options: .mutableContainers) as? [String: Any] else { return }
//                let course = Course(json: json)
//
//                print(course.name)
                
            } catch let jsonErr {
                print("Error JSONSerialization", jsonErr)
            }
            
        }.resume()
        
//        let myCourse = Course(id: 1, name: "Thusitha", link: "link#", imageUrl: "image url")
//        print(myCourse)
    }


}

