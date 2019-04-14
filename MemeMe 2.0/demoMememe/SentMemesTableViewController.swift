//
//  SentMemesViewController.swift
//  demoMememe
//
//  Created by Reem Aldughaither on 4/13/19.
//  Copyright © 2019 Udacity. All rights reserved.
//

import Foundation
import UIKit

class SentMemesTableViewController: UITableViewController {
    
    var memes: [Meme]! {
        let object = UIApplication.shared.delegate
        let appDelegate = object as! AppDelegate
        return appDelegate.memes
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
      
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.tabBarController?.tabBar.isHidden = false
        self.tableView.reloadData()
        
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.memes.count
    }
    
   override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "savedMeme")!
        let meme = self.memes[(indexPath as NSIndexPath).row]
        
        // Set the name and image
       cell.imageView?.image = meme.editedImage
    cell.textLabel?.text = meme.topText + " - " + meme.bottomText
        
    
        return cell
    }
    
    

    @IBAction func originalView(_ sender: Any) {
        let storyboard = UIStoryboard (name: "Main", bundle: nil)
        let resultVC = storyboard.instantiateViewController(withIdentifier: "ViewController")as! ViewController
        navigationController?.pushViewController(resultVC, animated: true)
    }
    
    
    
   
}
