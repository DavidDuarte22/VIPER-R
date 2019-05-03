//
//  HomePresenter.swift
//  Home
//
//  Created by David Duarte on 29/4/19.
//

import Foundation
import RxSwift

protocol AlbumDetailPresenterProtocol: class {
    
    var router: AlbumDetailRouterProtocol? { get set }
    var interactor: AlbumDetailInteractorProtocol? { get set }
    var view: AlbumDetailViewProtocol? { get set }
    
    // VIEW -> PRESENTER
    var presenterToViewSubject: PublishSubject<[PhotoItem]>? { get }

    func showAlbum() -> AlbumItem
    func showPhotos()
    func showPhotoDetail(_ photo: PhotoItem)
}
