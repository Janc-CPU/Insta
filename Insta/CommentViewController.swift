//
//  CommentViewController.swift
//  Insta
//
//  Created by Karina Badilla on 10/18/21.
//

import UIKit
import Parse

class CommentViewController: UIViewController {

    
    @IBOutlet weak var commentField: UITextField!
    
    
    @IBAction func onPostComment(_ sender: Any) {
        
        //let post = PFObject.current()!
        
        let comments = PFObject(className: "Comments")
        
        comments["comment"] = commentField.text
        comments["user"] = PFUser.current()!
        
        //FeedViewController.posts.add(comments, (forKey: "comments"))
        
        comments.saveInBackground { (success, error) in
            if success {
                self.dismiss(animated: true, completion: nil)
            } else {
                print("Error: \(error?.localizedDescription)")
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
