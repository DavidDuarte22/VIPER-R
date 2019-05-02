//
//  MainInteractor.swift
//  Main
//
//  Created by David Duarte on 21/4/19.
//

import Foundation
import RxSwift

protocol MainInteractorProtocol {
    
    var interactorToPresenterSubject: PublishSubject<[AlbumItem]>? { get }
    
    func fetchAlbums()//onSuccess: @escaping APISuccessHandler<[AlbumItem]>, onFailure: APIFailureHandler?)
}
