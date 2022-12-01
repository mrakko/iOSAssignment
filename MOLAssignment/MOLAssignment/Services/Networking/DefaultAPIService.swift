//
//  DefaultAPIService.swift
//  MOLAssignment
//
//  Created by Tajti Márk on 2022. 12. 01..
//

import Alamofire

final class DefaultAPIService {
    private let configurations: AppConfigurationInput
    private let headers: HTTPHeaders
    
    
    init(configurations: AppConfigurationInput) {
        self.configurations = configurations
        self.headers =  [
            "app-id": configurations.apiKey
        ]
    }
}

extension DefaultAPIService: APIService {
    func getPosts(completion: @escaping ((Result<PostListDTO, Error>) -> Void)) {
        AF.request(configurations.baseUrl + "/post", headers: headers)
            .validate()
            .responseDecodable(of: PostListDTO.self) { response in
                switch response.result {
                case .success(let dto):
                    completion(.success(dto))
                case .failure(let error):
                    completion(.failure(error))
                }
            }
    }
}
