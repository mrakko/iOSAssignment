//
//  APIService.swift
//  MOLAssignment
//
//  Created by Tajti Márk on 2022. 12. 01..
//

import Foundation

protocol APIService {
    func getPosts(completion: @escaping ((Result<PostListDTO, Error>) -> Void))
}
