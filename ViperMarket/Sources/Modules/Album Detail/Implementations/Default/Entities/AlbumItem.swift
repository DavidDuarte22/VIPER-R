//
//  AlbumItem.swift
//  ViperMarket
//
//  Created by David Duarte on 29/04/2019.
//  Copyright © 2019 David Duarte. All rights reserved.
//

import Foundation

class AlbumItem: Codable {
    
    var userId: Int
    var albumId: Int
    var title: String
    
    enum CodingKeys: String, CodingKey {
        case userId = "userId"
        case albumId = "id"
        case title = "title"
    }
    
    init(userId: Int, albumId: Int, title: String) {
        self.userId = userId
        self.albumId = albumId
        self.title = title
    }
}
