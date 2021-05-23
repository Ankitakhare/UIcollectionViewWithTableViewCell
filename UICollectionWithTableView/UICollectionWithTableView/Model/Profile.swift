//
//  Profile.swift
//  UICollectionWithTableView
//
//  Created by ankita on 5/20/21.
//  Copyright © 2021 ankita. All rights reserved.
//

import Foundation

struct Profile {
    
    var name: String?
    var biography: String?
    var twitter: String?
    
    init(profileName: String, biographyText: String,twitterHandler: String) {
        self.name = profileName
        self.biography = biographyText
        self.twitter = twitterHandler
    }
}
