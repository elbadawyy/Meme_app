//
//  MemeImageVC.swift
//  MemeMe v1.0
//
//  Created by Muhammad El-Badawy on 1/15/19.
//  Copyright © 2019 Muhammad El-Badawy. All rights reserved.
//

import Foundation
import UIKit

class MemeImageVC:UIViewController {
    
    
    @IBOutlet weak var imageView: UIImageView!
    
    var meme: Meme!
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        tabBarController?.tabBar.isHidden = true
        imageView!.image = meme.memedImage
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        tabBarController?.tabBar.isHidden = false
    }
}
