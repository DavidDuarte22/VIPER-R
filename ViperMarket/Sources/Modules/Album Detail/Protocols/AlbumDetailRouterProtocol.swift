//
//  HomeRouter.swift
//  Home
//
//  Created by David Duarte on 29/4/19.
//

import Foundation
import UIKit

protocol AlbumDetailRouterProtocol {
    
    static func createAlbumDetailRouterModule(with album: AlbumItem) -> UIViewController
    func presentToDoPhotoScreen(from view: AlbumDetailViewProtocol, for photo: PhotoItem)
    func navigateBackToListViewController(from view: AlbumDetailViewProtocol)
    
}
