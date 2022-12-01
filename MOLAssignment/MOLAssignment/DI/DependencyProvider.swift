//
//  DependencyProvider.swift
//  MOLAssignment
//
//  Created by Tajti Márk on 2022. 12. 01..
//

import Swinject
import Foundation

final class DependencyProvider {
    private static let container = Container()
    static var resolver: Resolver {
        container
    }
    
    static func registerDependencies() {
        // MARK: - AppConfiguration
        container.register(AppConfigurationInput.self) { _ in
            AppConfiguration(bundle: Bundle.main)!
        }
        
        // MARK: - APIService
        container.register(APIService.self) { r in
            DefaultAPIService(configurations: r.resolve(AppConfigurationInput.self)!)
        }
        
        // MARK: - Posts
        container.register(PostsPresenterInput.self) { r, view in
            PostsPresenter(interactor: r.resolve(PostsInteractorInput.self)!,
                           view: view)
        }
        container.register(PostsInteractorInput.self) { r in
            PostsInteractor(apiService: r.resolve(APIService.self)!)
        }
        container.register(PostsCoordinatorInput.self) { r in
            PostsCoordinator(sceneFactory: r.resolve(PostsSceneFactoryInput.self)!)
        }
        container.register(PostsSceneFactoryInput.self) { _ in
            PostsSceneFactory()
        }
    }
}
