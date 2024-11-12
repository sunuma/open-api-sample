//
//  ContentView.swift
//  swift-openapi-sample
//
//  Created by Shin Unuma on 2024/10/31.
//

import SwiftUI
import ComposableArchitecture

struct ContentView: View {
    let store: StoreOf<RepositoryList>
    
    init(store: StoreOf<RepositoryList> = Store(
        initialState: RepositoryList.State()
    ) {
        RepositoryList(
            apiClient: APIClient(),
            keyword: "Swift"
        )
    }) {
        self.store = store
    }
    
    var body: some View {
        VStack {
            ListView(store: store)
        }
    }
}

struct FeatureListView: View {
    var body: some View {
        VStack {
            ScrollView(.horizontal) {
                HStack {
                    
                }
            }
        }
    }
}

struct ListView: View {
    let store: StoreOf<RepositoryList>
    
    var body: some View {
        VStack(spacing: 0) {
            Text("Repositories")
                .font(.title2)
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(15)
            Divider()
            if store.isLoading {
                LoadingView()
            } else {
                ScrollView(.vertical) {
                    VStack {
                        ForEach(store.items, id: \.id) { item in
                            RepositoryView(item: item)
                        }
                    }
                    .padding(.top, 5)
                }
            }
        }
        .onAppear {
            store.send(.getRepositories)
        }
    }
}

struct LoadingView: View {
    var body: some View {
        ZStack {
            Color.black.opacity(0.2)
                .edgesIgnoringSafeArea(.all)
            ProgressView()
                .scaleEffect(1.5)
                .progressViewStyle(
                    CircularProgressViewStyle(tint: Color.white)
                )
        }
    }
}

#Preview {
    ContentView()
}
