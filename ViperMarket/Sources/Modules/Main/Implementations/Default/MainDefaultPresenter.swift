//
//  MainDefaultPresenter.swift
//  Main
//
//  Created by David Duarte on 21/4/19.
//

import Foundation
import RxSwift

class MainDefaultPresenter {
    
    var router: MainRouterProtocol?
    var interactor: MainInteractorProtocol?
    
    var presenterToViewSubject: PublishSubject<[AlbumItem]>?
    let disposeBag = DisposeBag()
    
    init() {
        self.presenterToViewSubject = PublishSubject<[AlbumItem]>()
    }
}


extension MainDefaultPresenter: MainPresenterProtocol {
    func showAlbums() {
        interactor?.fetchAlbums()
        let subscription = self.interactor?.interactorToPresenterSubject?.subscribe(
            onNext: {(albums) in
            self.presenterToViewSubject?.onNext(albums)
        },
            onError: {(error) in
            self.presenterToViewSubject?.onError(error)
        })
        subscription?.disposed(by: disposeBag)
        
    }
    
    func showAlbumDetail(_ view: MainViewProtocol, _ album: AlbumItem) {
        router?.presentToDoDetailScreen(from: view, for: album)
    }
    
}
