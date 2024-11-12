//
//  CommonView.swift
//  swift-openapi-sample
//
//  Created by Shin Unuma on 2024/11/12.
//

import SwiftUI

struct CircleImage: View {
    let url: URL?
    let width: CGFloat
    let placeholder: Image
    
    var body: some View {
        AsyncImage(url: url) { image in
            image
                .resizable()
        } placeholder: {
            placeholder
                .resizable()
        }
        .aspectRatio(contentMode: .fit)
        .frame(width: width)
        .cornerRadius(5)
    }
}
