//
//  PhotoDetailRouter.swift
//  PhotoDetail
//
//  Created by David Duarte on 3/5/19.
//

import Foundation
import UIKit

protocol PhotoDetailRouterProtocol {
    
    static func createPhotoDetailRouterModule(with photo: PhotoItem) -> UIViewController
    func navigateBackToListViewController(from view: AlbumDetailViewProtocol)
    
}
