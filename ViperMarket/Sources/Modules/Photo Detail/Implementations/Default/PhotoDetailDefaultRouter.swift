//
//  PhotoDetailDefaultRouter.swift
//  PhotoDetail
//
//  Created by David Duarte on 3/5/19.
//

import Foundation
import UIKit

class PhotoDetailDefaultRouter {
    static var storyboard: UIStoryboard {
        return UIStoryboard(name: "MainPhotoDetail", bundle: Bundle.main)
    }
}

extension PhotoDetailDefaultRouter: PhotoDetailRouterProtocol {
    static func createPhotoDetailRouterModule(with photo: PhotoItem) -> UIViewController {
        guard let photoDetailVC = storyboard.instantiateViewController(withIdentifier: "PhotoDetailDefaultViewController") as? PhotoDetailDefaultViewController else {
            fatalError("Invalid view controller type")
        }
        
        let presenter = PhotoDetailDefaultPresenter()
        let interactor = PhotoDetailDefaultInteractor()
        let router = PhotoDetailDefaultRouter()
        
        photoDetailVC.presenter = presenter
        interactor.photo = photo
        presenter.interactor = interactor
        presenter.router = router
        
        return photoDetailVC
    }
    
    func navigateBackToListViewController(from view: AlbumDetailViewProtocol) {
        guard let viewVC = view as? UIViewController else {
            fatalError("Invalid view protocol type")
        }
        viewVC.navigationController?.popViewController(animated: true)
    }
}
