//
//  PhotoDetailDefaultPresenter.swift
//  PhotoDetail
//
//  Created by David Duarte on 3/5/19.
//

import Foundation

class PhotoDetailDefaultPresenter {
    
    var router: PhotoDetailRouterProtocol?
    var interactor: PhotoDetailInteractorProtocol?
    
}

extension PhotoDetailDefaultPresenter: PhotoDetailPresenterProtocol {
    func showPhoto() -> PhotoItem {
        let photo = interactor?.fetchPhoto()
        return photo!
    }
    
}
