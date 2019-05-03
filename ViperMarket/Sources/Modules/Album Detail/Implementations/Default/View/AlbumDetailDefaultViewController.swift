//
//  HomeDefaultView.swift
//  Home
//
//  Created by David Duarte on 29/4/19.
//

import Foundation
import UIKit
import RxSwift

class AlbumDetailDefaultViewController: UIViewController {
    
    var presenter: AlbumDetailPresenterProtocol?
    var album: AlbumItem?
    var photos: [PhotoItem]?
    let disposeBag = DisposeBag()
    
    @IBOutlet weak var photosCollectionView: UICollectionView!
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        self.album = presenter?.showAlbum()
        presenter?.showPhotos()
        subscribeToObserver((self.presenter?.presenterToViewSubject)!)
        
        self.navigationItem.title = album?.title
        
        let backItem = UIBarButtonItem()
        backItem.title = " "
        navigationItem.backBarButtonItem = backItem
        
        photosCollectionView.dataSource = self
        photosCollectionView.delegate = self
    }
    
    func subscribeToObserver (_ subject: PublishSubject<[PhotoItem]>) {
        subject.subscribe(
            onNext: {(photos) in
                self.photos = photos
                print(photos)
               self.photosCollectionView.reloadData()
        },
            onError: {(error) in
                print(error)
        }).disposed(by: disposeBag)
    }
}

extension AlbumDetailDefaultViewController: UICollectionViewDelegate,
UICollectionViewDelegateFlowLayout, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.photos?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = photosCollectionView.dequeueReusableCell(withReuseIdentifier: "photoCard", for: indexPath) as? PhotoCollectionViewCell
        cell?.titleLabel.text = photos?[indexPath.row].title
        return cell!
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print(indexPath)
        //presenter?.showAlbumDetail(self, photos[indexPath.row])
    }
}


extension AlbumDetailDefaultViewController: AlbumDetailViewProtocol {
    
    

}
