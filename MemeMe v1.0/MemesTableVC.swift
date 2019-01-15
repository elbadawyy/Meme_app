//
//  MemesTableVC.swift
//  MemeMe v1.0
//
//  Created by Muhammad El-Badawy on 1/9/19.
//  Copyright © 2019 Muhammad El-Badawy. All rights reserved.
//

import UIKit


class MemesTableVC: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    var memes: [Meme]?
    
    @IBOutlet weak var tableView: UITableView!
    
   
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        memes = appDelegate.memes
        tableView.reloadData()
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.memes!.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "MemeCell",for:indexPath)
        let meme = memes?[indexPath.row]
        
        // Set the name and image
        cell.textLabel?.text = "\(meme!.topText) \(meme!.bottomText)"
        cell.imageView?.image = meme!.memedImage
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let detailController = self.storyboard!.instantiateViewController(withIdentifier: "MemeImageVC") as! MemeImageVC
        detailController.meme = self.memes![(indexPath as NSIndexPath).row]
        self.navigationController!.pushViewController(detailController, animated: true)
    }
    
    
    
}
