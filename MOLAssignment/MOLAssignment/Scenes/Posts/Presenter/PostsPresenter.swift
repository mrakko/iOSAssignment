//
//  PostsPresenter.swift
//  MOLAssignment
//
//  Created by Tajti Márk on 2022. 12. 01..
//

import Foundation

protocol PostsPresenterInput {
    
}

final class PostsPresenter {
    private let interactor: PostsInteractorInput
    private weak var view: PostsView?
    
    init(interactor: PostsInteractorInput, view: PostsView) {
        self.interactor = interactor
        self.view = view
    }
}

extension PostsPresenter: PostsPresenterInput {
    
}
