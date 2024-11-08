//
//  APIClient.swift
//  swift-openapi-sample
//
//  Created by Shin Unuma on 2024/11/01.
//

import OpenAPIRuntime
import OpenAPIURLSession
import Foundation

struct APIInfo {
    static let serverURL: URL = URL(string: "https://api.github.com")!
    static let transport: URLSessionTransport = URLSessionTransport()
}

protocol APIClientProtocol {
    /**
      レポジトリ検索
     */
    func searchRepositories(keyword: String) async throws -> GithubRepositories?
}

final class APIClient: APIClientProtocol {
    
    let client: any APIProtocol
    
    init(client: any APIProtocol = Client(
        serverURL: APIInfo.serverURL,
        transport: APIInfo.transport
    )) {
        self.client = client
    }
    
    func searchRepositories(keyword: String) async throws -> GithubRepositories? {
        let response = try await client.searchRepositories(query: .init(q: keyword))
        switch response {
        case .ok(let result):
            switch result.body {
            case .json(let repositories):
                return GithubRepositories.convertTo(repositories: repositories)
            }
        case .undocumented(let statusCode, let payload):
            break
        }
        return nil
    }

}
