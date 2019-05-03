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
    var presenterToViewSubject: PublishSubject<[PhotoItem]>? { get }

    func showPhotoDetail(_ view: AlbumDetailViewProtocol, _ photo: PhotoItem)
    func showAlbum() -> AlbumItem
    func showPhotos()
    
}
