//
//  SFSymbols.swift
//  swift-openapi-sample
//
//  Created by Shin Unuma on 2024/11/12.
//

import SwiftUI

public enum SFSymbols: String, Identifiable, CaseIterable, Hashable {
    case star
    case personCropCircle
    
    public var id: String {
        name
    }
    
    var name: String {
        rawValue.toDotSeparatedLowercase
    }

    public var image: Image {
        Image(systemName: name)
    }
    
}
