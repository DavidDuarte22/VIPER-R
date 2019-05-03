//
//  HomeDefaultRouter.swift
//  Home
//
//  Created by David Duarte on 29/4/19.
//

import Foundation
import UIKit

class AlbumDetailDefaultRouter {

    weak var presenter: AlbumDetailPresenterProtocol?
    weak var viewController: UIViewController?
    
    static var storyboard: UIStoryboard {
        return UIStoryboard(name: "MainDetail", bundle: Bundle.main)
    }
    
}

extension AlbumDetailDefaultRouter: AlbumDetailRouterProtocol {
    static func instanciateHomeModule() -> UIViewController {
        let navController = storyboard.instantiateViewController(withIdentifier: "NavigationController") as! UINavigationController
        guard let todoListViewController = navController.topViewController as? AlbumDetailDefaultViewController else { fatalError("Invalid View Controller") }
        let presenter = AlbumDetailDefaultPresenter()
        let interactor = AlbumDetailDefaultInteractor()
        let router = AlbumDetailDefaultRouter()
        
        todoListViewController.presenter = presenter
        presenter.interactor = interactor
        presenter.router = router
        
        return navController
    }
    
    static func createAlbumDetailRouterModule(with album: AlbumItem) -> UIViewController {
        guard let todoDetailVC = storyboard.instantiateViewController(withIdentifier: "AlbumDetailDefaultViewController") as? AlbumDetailDefaultViewController else {
            fatalError("Invalid view controller type")
        }
        
        let presenter = AlbumDetailDefaultPresenter()
        let interactor = AlbumDetailDefaultInteractor()
        let router = AlbumDetailDefaultRouter()
        
        todoDetailVC.presenter = presenter
        interactor.album = album
        presenter.view = todoDetailVC
        presenter.interactor = interactor
        presenter.router = router
        
        return todoDetailVC
    }
    
    func navigateBackToListViewController(from view: AlbumDetailViewProtocol) {
        guard let viewVC = view as? UIViewController else {
            fatalError("Invalid view protocol type")
        }
        viewVC.navigationController?.popViewController(animated: true)
    }
    

}
