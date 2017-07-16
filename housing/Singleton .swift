//
//  Singleton .swift
//  housing
//
//  Created by Julian Martinez on 7/15/17.
//  Copyright © 2017 Cesar Ibarra. All rights reserved.
//

import Foundation
import UIKit

class Singleton {

    static let INSTANCE = Singleton()
    
    private static var image = UIImage()
    
    private init() {
    }
    
    public static func getInstance() -> Singleton {
        return INSTANCE
    }
    
    public static func getImage() -> UIImage {
        return image;
    }
    
    public static func setImage(newImage : UIImage) {
        image = newImage;
    }
}

