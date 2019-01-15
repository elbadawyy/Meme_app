//
//  MemesCollectionVC.swift
//  MemeMe v1.0
//
//  Created by Muhammad El-Badawy on 1/13/19.
//  Copyright © 2019 Muhammad El-Badawy. All rights reserved.
//

import UIKit

class MemesCollectionVC: UIViewController,UICollectionViewDelegate,UICollectionViewDataSource {
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    
    var memes: [Meme]?
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        memes = appDelegate.memes
        collectionView.reloadData()
    }
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
       
        return memes!.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MemeCollectionViewCell", for: indexPath) as! MemeCollectionViewCell
        let meme = memes![indexPath.row]
        
        // Set the name and image
        cell.memeLabel.text = "\(meme.topText) \(meme.bottomText)"
        cell.memeImageView?.image = meme.memedImage
        
        return cell
        
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        
        let detailController = self.storyboard!.instantiateViewController(withIdentifier: "MemeImageVC") as! MemeImageVC
        detailController.meme = self.memes![(indexPath as NSIndexPath).row]
        self.navigationController!.pushViewController(detailController, animated: true)
    }
    
    
}
