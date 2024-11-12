//
//  Integer+.swift
//  swift-openapi-sample
//
//  Created by Shin Unuma on 2024/11/12.
//

import Foundation

private let commaFormatter: NumberFormatter = {
    let f = NumberFormatter()
    f.numberStyle = .decimal
    f.groupingSeparator = ","
    f.groupingSize = 3
    return f
}()

extension Int {
    
    var withComma: String {
        return commaFormatter.string(from: NSNumber(integerLiteral: self)) ?? "\(self)"
    }
    
}
