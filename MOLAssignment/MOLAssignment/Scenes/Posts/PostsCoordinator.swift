//
//  PostsCoordinator.swift
//  MOLAssignment
//
//  Created by Tajti Márk on 2022. 12. 01..
//

import UIKit

protocol PostsCoordinatorInput: CoordinatorInput {
    // e.g. showPostDetail()
}

final class PostsCoordinator {
    private let sceneFactory: PostsSceneFactoryInput
    
    init(sceneFactory: PostsSceneFactoryInput) {
        self.sceneFactory = sceneFactory
    }
    
    func start() -> UIViewController {
        sceneFactory.createPostsViewController()
    }
}

extension PostsCoordinator: PostsCoordinatorInput {}
