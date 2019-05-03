//
//  PhotoDetailPresenter.swift
//  PhotoDetail
//
//  Created by David Duarte on 3/5/19.
//

import Foundation

protocol PhotoDetailPresenterProtocol: class {
    
    var router: PhotoDetailRouterProtocol? { get set }
    var interactor: PhotoDetailInteractorProtocol? { get set }
    
    func showPhoto() -> PhotoItem
}
