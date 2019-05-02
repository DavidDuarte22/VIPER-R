//
//  MainDefaultInteractor.swift
//  Main
//
//  Created by David Duarte on 21/4/19.
//

import Foundation
import RxSwift

class MainDefaultInteractor {
    //var todoStore = TodoStore.shared
    var interactorToPresenterSubject: PublishSubject<[AlbumItem]>?
    
    init() {
        self.interactorToPresenterSubject = PublishSubject<[AlbumItem]>()
    }
    
    let httpclient = HttpClient.init()
    
}

extension MainDefaultInteractor: MainInteractorProtocol {
    func fetchAlbums() {
        self.httpclient.callGet(serviceUrl: "https://jsonplaceholder.typicode.com/albums",
            success: {(arrayResult: [AlbumItem], response: HttpResponse?) in
                self.interactorToPresenterSubject?.onNext(arrayResult)}
            ,failure: { (error: Error, response: HttpResponse?) in
                self.interactorToPresenterSubject?.onError(error)}
        )}
}
