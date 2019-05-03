//
//  HomeDefaultPresenter.swift
//  Home
//
//  Created by David Duarte on 29/4/19.
//

import Foundation
import RxSwift

class AlbumDetailDefaultPresenter {
    
    var router: AlbumDetailRouterProtocol?
    var interactor: AlbumDetailInteractorProtocol?
    
    var presenterToViewSubject: PublishSubject<[PhotoItem]>?
    let disposeBag = DisposeBag()
    
    init() {
        self.presenterToViewSubject = PublishSubject<[PhotoItem]>()
    }
}

extension AlbumDetailDefaultPresenter: AlbumDetailPresenterProtocol {
    func showAlbum() -> AlbumItem {
        let album = interactor?.fetchAlbum()
        return album!
    }
    
    func showPhotos() {
        interactor?.fetchPhotos()
        let subscription = self.interactor?.interactorToPresenterSubject?.subscribe(
            onNext: {(photos) in
                self.presenterToViewSubject?.onNext(photos)
        },
            onError: {(error) in
                self.presenterToViewSubject?.onError(error)
        })
        subscription?.disposed(by: disposeBag)
        
    }
    
    func showPhotoDetail(_ view: AlbumDetailViewProtocol, _ photo: PhotoItem) {
        router?.presentToDoPhotoScreen(from: view, for: photo)
    }

}
