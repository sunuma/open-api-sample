//
//  RepositoryListReducer.swift
//  swift-openapi-sample
//
//  Created by Shin Unuma on 2024/11/12.
//

import SwiftUI
import ComposableArchitecture

@Reducer
struct RepositoryList {
    let apiClient: APIClientProtocol
    var keyword: String
    
    @ObservableState
    struct State: Equatable {
        var isLoading: Bool = false
        var items: [RepositoryListItem] = []
    }
    
    enum Action {
        case getRepositories
        case response(items: [RepositoryListItem])
    }
    
    var body: some Reducer<State, Action> {
        Reduce { state, action in
            switch action {
            case .getRepositories:
                state.isLoading = true
                return .run { send in
                    let repositories = try await apiClient.searchRepositories(keyword: keyword)
                    let items = repositories?.items.compactMap { $0.convertToListItem() } ?? []
                    await send(.response(items: items))
                }
            case .response(let items):
                state.items = items
                state.isLoading = false
                return .none
            }
        }
    }
}
