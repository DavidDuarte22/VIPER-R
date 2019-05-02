//
//  HomeDefaultPresenter.swift
//  Home
//
//  Created by David Duarte on 29/4/19.
//

import Foundation

class AlbumDetailDefaultPresenter {
    
    var router: AlbumDetailRouterProtocol?
    var interactor: AlbumDetailInteractorProtocol?
    weak var view: AlbumDetailViewProtocol?
}

extension AlbumDetailDefaultPresenter: AlbumDetailPresenterProtocol {
    func viewDidLoad() {
        
    }
    
    func showPhotoDetail(_ photo: PhotoItem) {
        
    }
    

}
