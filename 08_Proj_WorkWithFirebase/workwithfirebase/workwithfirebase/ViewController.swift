//
//  ViewController.swift
//  workwithfirebase
//
//  Created by thusitha on 8/2/20.
//  Copyright © 2020 nibm. All rights reserved.
//

import UIKit
import FirebaseDatabase

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        var ref: DatabaseReference!

        ref = Database.database().reference()
        
        guard let key = ref.child("posts").childByAutoId().key else { return }
        let post = ["uid": 1200,
                    "author": "No Name",
                    "title": "The title",
                    "body": "NoBody"] as [String : Any]
        let childUpdates = ["/posts/\(key)": post,
                            "/user-posts/\(1200)/\(key)/": post]
        ref.updateChildValues(childUpdates)
        
    }


}

