//
//  PostsViewController.swift
//  MOLAssignment
//
//  Created by Tajti Márk on 2022. 12. 01..
//

import UIKit

protocol PostsView: AnyObject {
    
}

final class PostsViewController: UIViewController {
    var presenter: PostsPresenterInput!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
    }
    
    private func setupViews() {
        view.backgroundColor = .yellow
    }
}

extension PostsViewController: PostsView {
    
}
