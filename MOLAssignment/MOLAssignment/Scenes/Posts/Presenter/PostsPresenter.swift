//
//  PostsPresenter.swift
//  MOLAssignment
//
//  Created by Tajti Márk on 2022. 12. 01..
//

import Foundation

protocol PostsPresenterInput {
    func viewDidLoad()
    func getPostPresentationModels() -> [PostPresentationModel]
}

final class PostsPresenter {
    private let interactor: PostsInteractorInput
    private weak var view: PostsView?
    private var posts: [PostPresentationModel] = []
    
    enum Section {
        case main
    }
    
    init(interactor: PostsInteractorInput, view: PostsView) {
        self.interactor = interactor
        self.view = view
    }
    
    private func createPresentationModel(from dtos: [PostListItemDTO]) -> [PostPresentationModel] {
        dtos.map {
            PostPresentationModel(title: $0.text)
        }
    }
}

extension PostsPresenter: PostsPresenterInput {
    func viewDidLoad() {
        interactor.getPosts { [weak self] result in
            guard let self = self else { return }
            switch result {
            case .success(let items):
                self.posts = self.createPresentationModel(from: items)
                self.view?.reload()
            case .failure(let error):
                print(error)
            }
        }
    }
    
    func getPostPresentationModels() -> [PostPresentationModel] {
        posts
    }
}
