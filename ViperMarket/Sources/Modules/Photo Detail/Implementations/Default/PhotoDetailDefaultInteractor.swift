//
//  PhotoDetailDefaultInteractor.swift
//  PhotoDetail
//
//  Created by David Duarte on 3/5/19.
//

import Foundation

class PhotoDetailDefaultInteractor {
    var photo: PhotoItem!
    
}

extension PhotoDetailDefaultInteractor: PhotoDetailInteractorProtocol {
    func fetchPhoto() -> PhotoItem {
        return photo
    }
}
