//
//  HomePresenter.swift
//  Home
//
//  Created by David Duarte on 29/4/19.
//

import Foundation

protocol AlbumDetailPresenterProtocol: class {
    
    var router: AlbumDetailRouterProtocol? { get set }
    var interactor: AlbumDetailInteractorProtocol? { get set }
    var view: AlbumDetailViewProtocol? { get set }
    
    // VIEW -> PRESENTER
    func viewDidLoad()
    func showPhotoDetail(_ photo: PhotoItem)
}
