//
//  RepositoryView.swift
//  swift-openapi-sample
//
//  Created by Shin Unuma on 2024/11/12.
//

import SwiftUI
import ComposableArchitecture

struct RepositoryView: View {
    let item: RepositoryListItem
    
    var body: some View {
        VStack(alignment: .leading, spacing: 7) {
            RepositoryOwnerView(
                ownerUrl: item.ownerUrl,
                ownerName: item.ownerName
            )
            .padding(.top, 10)
            Text(item.name)
                .font(.title3)
                .bold()
            Text(item.description ?? "")
                .font(.subheadline)
            RepositoryFooterView(
                language: item.language,
                stargazersCount: item.stargazersCount
            )
            Divider()
                .padding(.top, 10)
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding(.horizontal, 15)
    }
}

private struct RepositoryOwnerView: View {
    let ownerUrl: String
    let ownerName: String
    
    var body: some View {
        HStack(spacing: 10) {
            CircleImage(
                url: URL(string: ownerUrl),
                width: 25,
                placeholder: SFSymbols.personCropCircle.image
            )
            Text(ownerName)
                .font(.body)
                .foregroundColor(.secondary)
        }
    }
}

private struct RepositoryFooterView: View {
    let language: String
    let stargazersCount: Int
    
    var body: some View {
        HStack(spacing: 5) {
            SFSymbols.star.image
                .resizable()
                .frame(width: 15, height: 15)
                .foregroundColor(.secondary)
            Text(stargazersCount.withComma)
                .font(.body)
                .foregroundColor(.secondary)
            Spacer()
                .frame(width: 10)
            Circle()
                .frame(width: 13)
                .foregroundColor(.secondary)
            Text(language)
                .font(.body)
                .foregroundColor(.secondary)
        }
    }
}
