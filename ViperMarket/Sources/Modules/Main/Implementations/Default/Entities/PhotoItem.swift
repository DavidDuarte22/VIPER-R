//
//  PhotoItem.swift
//  ViperMarket
//
//  Created by David Duarte on 29/04/2019.
//  Copyright © 2019 David Duarte. All rights reserved.
//

import Foundation
import UIKit

class PhotoItem: Codable {
    
    var title: String
    var description: String
    var photo: String
    
    enum CodingKeys: String, CodingKey {
        case title = "title"
        case description = "description"
        case photo = "photo"
    }
    
    init(title: String, description: String, photo: String) {
        self.title = title
        self.description = description
        self.photo = photo
    }
}
