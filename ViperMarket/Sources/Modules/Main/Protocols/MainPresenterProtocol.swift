//
//  MainPresenterProtocol.swift
//  Main
//
//  Created by David Duarte on 21/4/19.
//

import Foundation
import RxSwift

protocol MainPresenterProtocol: class {
    
    var router: MainRouterProtocol? { get set }
    var interactor: MainInteractorProtocol? { get set }
    
    var presenterToViewSubject: PublishSubject<[AlbumItem]>? { get }
    
    func showAlbums()
    func showPhotoDetail(_ photo: PhotoItem)
    func showAlbumDetail(_ album: AlbumItem)
}
