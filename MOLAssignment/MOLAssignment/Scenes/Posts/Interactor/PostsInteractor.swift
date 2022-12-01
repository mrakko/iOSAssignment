//
//  PostsInteractor.swift
//  MOLAssignment
//
//  Created by Tajti Márk on 2022. 12. 01..
//

import Foundation

protocol PostsInteractorInput {
    func getPosts(completion: @escaping ((Result<[PostListItemDTO], Error>) -> Void))
}

final class PostsInteractor {
    private let apiService: APIService
    
    init(apiService: APIService) {
        self.apiService = apiService
    }
}

extension PostsInteractor: PostsInteractorInput {
    func getPosts(completion: @escaping ((Result<[PostListItemDTO], Error>) -> Void)) {
        apiService.getPosts { result in
            switch result {
            case .success(let dto):
                completion(.success(dto.data))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
}
