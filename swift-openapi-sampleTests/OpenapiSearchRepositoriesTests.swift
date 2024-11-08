//
//  OpenapiSearchRepositoriesTests.swift
//  swift-openapi-sample
//
//  Created by Shin Unuma on 2024/11/08.
//

import Testing
@testable import swift_openapi_sample

struct OpenapiSearchRepositoriesTests {
    
    @Test func testSearchRepositoriesRequest() async throws {
        let apiClient = APIClient()
        let response = try await apiClient.searchRepositories(keyword: "Swift")
        #expect(response != nil)
        if let response {
            #expect(response.totalCount > 0 && response.items.count > 0)
        }
    }
}
