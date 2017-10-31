//
//  Macros.swift
//  testApp Vesti Reader
//
//  Created by Zakirzhan Aisabaev on 31.10.17.
//  Copyright © 2017 Zakirzhan Aisabaev. All rights reserved.
//

import Foundation
import UIKit

struct Macros {
    //MARK: Global Colors
    struct GlobalColors {
        //Global Colors
        static let gold = UIColor(red: 252/255, green: 206/255, blue: 84/255, alpha: 1.0)
        static let mainColor = UIColor(red: 252/255, green: 206/255, blue: 84/255, alpha: 1.0)
        static let mainColorSoft = UIColor(red: 252/255, green: 206/255, blue: 84/255, alpha: 1.0)
        static let mainColorDark = UIColor(red: 245/255, green: 186/255, blue: 66/255, alpha: 1.0)
        static let secondaryColor = UIColor(red: 252/255, green: 206/255, blue: 84/255, alpha: 1.0)
        static let softColor = UIColor(red: 246/255, green: 247/255, blue: 249/255, alpha: 1.0)
        static let completionColor = UIColor(red: 67/255, green: 203/255, blue: 111/255, alpha: 1.0)
        static let errorColor = UIColor(red: 237/255, green: 95/255, blue: 85/255, alpha: 1.0)
        static let bgColor = UIColor(red:0.20, green:0.60, blue:0.86, alpha:1.0)
        static let fontColor = UIColor(red:0.16, green:0.50, blue:0.73, alpha:1.0)
        static let bgColorDark = UIColor(red: 44/255, green: 62/255, blue: 80/255, alpha: 1.0)
        
        //TC - text color
        static let regularTC = UIColor(red: 51/255, green: 51/255, blue: 51/255, alpha: 1.0)
        static let secondaryTC = UIColor(red: 51/255, green: 51/255, blue: 51/255, alpha: 0.8)
        static let hintTC = UIColor(red: 197/255, green: 204/255, blue: 212/255, alpha: 1.0)
        static let softTC = UIColor(red: 144/255, green: 149/255, blue: 155/255, alpha: 1.0)
        
        //SC - Fill color
        static let likeColor = UIColor(red: 68/255, green: 204/255, blue: 112/255, alpha: 1.0)
        static let likeColorBorder = UIColor(red: 59/255, green: 183/255, blue: 93/255, alpha: 1.0)
        
        static let neutralColor = UIColor(red: 250/255, green: 177/255, blue: 83/255, alpha: 1.0)
        static let neutralColorBorder = UIColor(red: 245/255, green: 155/255, blue: 67/255, alpha: 1.0)
        
        static let dislikeColor = UIColor(red: 237/255, green: 95/255, blue: 85/255, alpha: 1.0)
        static let dislikeColorBorder = UIColor(red: 217/255, green: 77/255, blue: 68/255, alpha: 1.0)
    }
    
    //MARK: Font Parameters
    struct Fonts {
        //TF - type face
        static let regular = "OpenSansCondensed-Light"
        static let bold = "OpenSansCondensed-Bold"
         
        //FS - font size
        static let bigFS: CGFloat = 21
        static let headerFS: CGFloat = 18
        static let bodyFS: CGFloat = 16
        static let hintFS: CGFloat = 12
}

}
