//
//  HomeDefaultView.swift
//  Home
//
//  Created by David Duarte on 29/4/19.
//

import Foundation
import UIKit

class AlbumDetailDefaultViewController: UIViewController {
    
    var presenter: AlbumDetailPresenterProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()
   
    }
}

extension AlbumDetailDefaultViewController: AlbumDetailViewProtocol {
    
    

}
