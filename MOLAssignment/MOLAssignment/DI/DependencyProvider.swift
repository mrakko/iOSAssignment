//
//  DependencyProvider.swift
//  MOLAssignment
//
//  Created by Tajti Márk on 2022. 12. 01..
//

import Swinject

final class DependencyProvider {
    private static let container = Container()
    static var resolver: Resolver {
        container
    }
    
    static func registerDependencies() {
        // MARK: - Posts
        container.register(PostsPresenterInput.self) { r, view in
            PostsPresenter(interactor: r.resolve(PostsInteractorInput.self)!,
                           view: view)
        }
        container.register(PostsInteractorInput.self) { _ in
            PostsInteractor()
        }
        container.register(PostsCoordinatorInput.self) { r in
            PostsCoordinator(sceneFactory: r.resolve(PostsSceneFactoryInput.self)!)
        }
        container.register(PostsSceneFactoryInput.self) { _ in
            PostsSceneFactory()
        }
    }
}
