//
//  PostTableViewController.swift
//  restapi
//
//  Created by thusitha on 8/2/20.
//  Copyright © 2020 nibm. All rights reserved.
//

import UIKit

struct Post: Decodable {
    var id: Int?
    var userId: Int?
    var title: String?
    var body: String?
}

class PostTableViewController: UITableViewController {
    
    var allPosts = [Post]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        getPosts()
    }
    
    func getPosts () {
        let jsonUrlString = "https://jsonplaceholder.typicode.com/posts"
        
        HttpClientApi.instance().makeAPICall(url: jsonUrlString, params: nil, method: .GET, success: { (data, response, error) in
            print("data loaded")
            
            guard let data = data else { return }
            
            do {
                let posts = try JSONDecoder().decode([Post].self, from: data)
                
                self.allPosts.append(Post(id: 1, userId: 1222, title: "title 1", body: "body 2"))
                
                
                
            } catch let jsonError {
                print("Decode Error ", jsonError)
            }
        }) { (data, response, error) in
            print("wrong api call", error)
        }
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        
        return 1
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 170
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return allPosts.count
    }


    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "postcell", for: indexPath) as! PostTableViewCell

        cell.lblTitle.text = allPosts[indexPath.row].title
        cell.lblBody.text = allPosts[indexPath.row].body

        return cell
    }

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
