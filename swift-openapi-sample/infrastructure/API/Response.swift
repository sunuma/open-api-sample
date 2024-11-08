//
//  Response.swift
//  swift-openapi-sample
//
//  Created by Shin Unuma on 2024/11/01.
//

struct GithubRepositories: Codable {
    let items: [GithubRepository]
    let totalCount: Int
}

struct GithubRepository: Codable {
    let id: Int
    let name: String
    let fullName: String
    let language: String
    let stargazersCount: Int
    let watchersCount: Int
    let forksCount: Int
    let openIssuesCount: Int
    let description: String?
    let owner: Owner
    
    struct Owner: Codable {
        let avatarUrl: String
        let login: String
    }
}

extension GithubRepositories {
    static func convertTo(repositories: Components.Schemas.Repositories) -> GithubRepositories {
        let items = repositories.items.map { GithubRepository.convertTo(repository: $0) }
        return GithubRepositories(items: items, totalCount: repositories.total_count)
    }
}

extension GithubRepository {
    static func convertTo(repository: Components.Schemas.Repositories.itemsPayloadPayload) -> GithubRepository {
        return GithubRepository(
            id: repository.id,
            name: repository.name,
            fullName: repository.full_name,
            language: repository.language,
            stargazersCount: repository.stargazers_count,
            watchersCount: repository.watchers_count,
            forksCount: repository.forks_count,
            openIssuesCount: repository.open_issues_count,
            description: repository.description,
            owner: GithubRepository.Owner.convertTo(owner: repository.owner)
        )
    }
}

extension GithubRepository.Owner {
    static func convertTo(owner: Components.Schemas.Repositories.itemsPayloadPayload.ownerPayload) -> GithubRepository.Owner {
        return GithubRepository.Owner(
            avatarUrl: owner.avatar_url,
            login: owner.login
        )
    }
}
