//
//  MainRouter.swift
//  Main
//
//  Created by David Duarte on 21/4/19.
//

import Foundation
import UIKit

protocol MainRouterProtocol {
    //associatedtype Transition
    
    //func handleTransition(transition: Transition, completion: (() -> Void)?)
    
    static func instanciateHomeModule() -> UIViewController
        
    // PRESENTER -> ROUTER
    func presentToDoDetailScreen(from view: MainViewProtocol, for todo: AlbumItem)
}
