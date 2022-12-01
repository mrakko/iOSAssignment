//
//  PostsSceneFactory.swift
//  MOLAssignment
//
//  Created by Tajti Márk on 2022. 12. 01..
//

import Foundation

protocol PostsSceneFactoryInput {
    func createPostsViewController() -> PostsViewController
}

final class PostsSceneFactory {}

extension PostsSceneFactory: PostsSceneFactoryInput {
    func createPostsViewController() -> PostsViewController {
        let view = PostsViewController()
        view.presenter = DependencyProvider.resolver.resolve(PostsPresenterInput.self, argument: view as PostsView)!
        return view
    }
}
