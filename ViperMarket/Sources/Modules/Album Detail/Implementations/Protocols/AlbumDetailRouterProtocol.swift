//
//  HomeRouter.swift
//  Home
//
//  Created by David Duarte on 29/4/19.
//

import Foundation
import UIKit

protocol AlbumDetailRouterProtocol {
    
    var presenter: AlbumDetailPresenterProtocol? { get set }
    
    static func createAlbumDetailRouterModule(with album: AlbumItem) -> UIViewController
    // PRESENTER -> ROUTER
    func navigateBackToListViewController(from view: AlbumDetailViewProtocol)
    
}
