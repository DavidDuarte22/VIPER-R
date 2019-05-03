//
//  MainDefaultView.swift
//  Main
//
//  Created by David Duarte on 21/4/19.
//

import Foundation
import UIKit
import RxSwift

class MainDefaultViewController: UIViewController {
    
    var presenter: MainPresenterProtocol?
    
    @IBOutlet weak var albumsCollectionView: UICollectionView!
    let disposeBag = DisposeBag()
    var albums: [AlbumItem] = []

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    
        self.presenter?.showAlbums()
        subscribeToObserver((self.presenter?.presenterToViewSubject)!)
        
        albumsCollectionView.dataSource = self
        albumsCollectionView.delegate = self
    }
    
    func subscribeToObserver (_ subject: PublishSubject<[AlbumItem]>) {
        subject.subscribe(
            onNext: {(albums) in
                self.albums = albums
                self.albumsCollectionView.reloadData()
        },
            onError: {(error) in
                print(error)
        }).disposed(by: disposeBag)
    }
}


extension MainDefaultViewController: MainViewProtocol {
    func showAlbums(_ albums: [AlbumItem]) {
    }
    
    func showErrorMessage(_ message: String) {
    }
}

extension MainDefaultViewController: UICollectionViewDelegate,
UICollectionViewDelegateFlowLayout, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.albums.count
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        
        let totalCellWidth = 158 * 2
        let totalSpacingWidth = 20 * (2 - 1)
        
        let leftInset = (albumsCollectionView.contentSize.width - CGFloat(totalCellWidth + totalSpacingWidth)) / 2
        let rightInset = leftInset
        
        return UIEdgeInsets(top: 0, left: leftInset, bottom: 0, right: rightInset)
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = albumsCollectionView.dequeueReusableCell(withReuseIdentifier: "card", for: indexPath) as? CardCollectionViewCell
        cell?.titleLabel.text = albums[indexPath.row].title
        return cell!
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        presenter?.showAlbumDetail(self, albums[indexPath.row])
    }
}
