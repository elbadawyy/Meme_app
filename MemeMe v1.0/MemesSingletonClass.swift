//
//  MemesSingletonClass.swift
//  MemeMe v1.0
//
//  Created by Muhammad El-Badawy on 1/16/19.
//  Copyright © 2019 Muhammad El-Badawy. All rights reserved.
//

import UIKit

class SharedMemes {
    private init() { }
    static let sharedInstance = SharedMemes()
    var memes = [Meme]()
}
