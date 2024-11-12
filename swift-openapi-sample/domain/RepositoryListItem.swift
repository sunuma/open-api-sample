//
//  Repository.swift
//  swift-openapi-sample
//
//  Created by Shin Unuma on 2024/11/12.
//

struct RepositoryListItem: Equatable {
    let id: Int
    let name: String
    let fullName: String
    let language: String
    let stargazersCount: Int
    let ownerUrl: String
    let ownerName: String
    let description: String?
    
    static func == (lhs: Self, rhs: Self) -> Bool {
        lhs.id == rhs.id
    }
}

extension GithubRepository {
    func convertToListItem() -> RepositoryListItem {
        RepositoryListItem(
            id: id,
            name: name,
            fullName: fullName,
            language: language,
            stargazersCount: stargazersCount,
            ownerUrl: owner.avatarUrl,
            ownerName: owner.login,
            description: description
        )
    }
}
