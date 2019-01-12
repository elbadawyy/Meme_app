//
//  MemesTableView.swift
//  MemeMe v1.0
//
//  Created by Muhammad El-Badawy on 1/6/19.
//  Copyright © 2019 Muhammad El-Badawy. All rights reserved.
//

import Foundation
import UIKit

class RootTabBarViewController: UITabBarController{
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Add New Meme", style: .plain, target: self, action: #selector(addNewMeme))
    }
    
    @objc func addNewMeme() {
     
    }
    
}
