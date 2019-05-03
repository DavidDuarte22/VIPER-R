//
//  HomeInteractor.swift
//  Home
//
//  Created by David Duarte on 29/4/19.
//

import Foundation
import RxSwift

protocol AlbumDetailInteractorProtocol {
    var interactorToPresenterSubject: PublishSubject<[PhotoItem]>? { get }
    func fetchAlbum() -> AlbumItem
    func fetchPhotos()
}
