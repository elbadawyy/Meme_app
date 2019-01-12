//
//  MemesCollectionVC.swift
//  MemeMe v1.0
//
//  Created by Muhammad El-Badawy on 1/13/19.
//  Copyright © 2019 Muhammad El-Badawy. All rights reserved.
//

import Foundation
import UIKit

class MemesCollectionVC: UIViewController,UICollectionViewDelegate,UICollectionViewDataSource {
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    
    var memes: [Meme]?
    
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        memes = appDelegate.memes
        collectionView.reloadData()
    }
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.memes!.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MemeCollectionViewCell", for: indexPath)
        let meme = memes![indexPath.row]
        
        // Set the image
//        cell.memeImageView?.image = meme.memedImage
        
        return cell
        
    }
    
    
}