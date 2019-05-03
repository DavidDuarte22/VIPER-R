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
    var albumId: Int
    var id: Int
    var title: String
    var url: String
    var thumbnailUrl: String
    
    enum CodingKeys: String, CodingKey {
        case albumId = "albumId"
        case id = "id"
        case title = "title"
        case url = "url"
        case thumbnailUrl = "thumbnailUrl"
    }
    
    init(albumId: Int, id: Int, title: String, url: String, thumbnailUrl: String) {
        self.id = id
        self.albumId = albumId
        self.title = title
        self.url = url
        self.thumbnailUrl = thumbnailUrl
    }
}
