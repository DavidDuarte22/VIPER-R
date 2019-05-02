//
//  MainView.swift
//  Main
//
//  Created by David Duarte on 21/4/19.
//

import UIKit

protocol MainViewProtocol: class {
    
    var presenter: MainPresenterProtocol? { get set }

    // PRESENTER -> VIEW
    func showAlbums(_ albums: [AlbumItem])
    func showErrorMessage(_ message: String)
}
