//
//  AppCoordinator.swift
//  MOLAssignment
//
//  Created by Tajti Márk on 2022. 12. 01..
//

import UIKit

final class AppCoordinator {
    private var window: UIWindow
    
    init?(window: UIWindow?) {
        guard let window = window else { return nil }
        self.window = window
    }
    
    func start() {
        window.rootViewController = PostsCoordinator(sceneFactory: PostsSceneFactory()).start()
        window.makeKeyAndVisible()
    }
}
