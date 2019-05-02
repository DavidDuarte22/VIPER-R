//
//  MainDefaultRouter.swift
//  Main
//
//  Created by David Duarte on 21/4/19.
//

import Foundation
import UIKit

class MainDefaultRouter {
    
    static var storyboard: UIStoryboard {
        return UIStoryboard(name: "Main", bundle: Bundle.main)
    }

}

extension MainDefaultRouter: MainRouterProtocol {
    static func instanciateHomeModule() -> UIViewController {
        let navController = storyboard.instantiateViewController(withIdentifier: "NavigationController") as! UINavigationController
        guard let HomeViewController = navController.topViewController as? MainDefaultViewController else { fatalError("Invalid View Controller") }
        
        let presenter = MainDefaultPresenter()
        let interactor = MainDefaultInteractor()
        let router = MainDefaultRouter()
        
        HomeViewController.presenter = presenter
        presenter.interactor = interactor
        presenter.router = router
        
        return navController
    }
    
    func presentToDoDetailScreen(from view: MainViewProtocol, for album: AlbumItem) {
       let todoDetailVC = AlbumDetailDefaultRouter.createAlbumDetailRouterModule(with: album)
        
        guard let viewVC = view as? UIViewController else {
            fatalError("Invalid View Protocol type")
        }
        
       viewVC.navigationController?.pushViewController(todoDetailVC, animated: true)
    }
    
}




//    func handleTransition(transition: AlbumsListTransition, completion: (() -> Void)?) {
//        switch transition {
//        case .showIn(let viewController, let presenter):
//
//        //  show(in: viewController, presenter: presenter)
//        case .showDetailForAlbum(let album, let viewController):
//
//        // .showDetailForAlbum(
//        case .dismiss(let viewController):
//        //
//        }
//    }
//
//}
//
//enum AlbumsListTransition {
//    case showDetailForAlbum(album: AlbumItem, viewController: UIViewController)
//    case dismiss(viewController: UIViewController)
//}
