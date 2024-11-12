//
//  StringExtensions.swift
//  swift-openapi-sample
//
//  Created by Shin Unuma on 2024/11/12.
//

extension String {

    var initialUppercased: String {
        guard !isEmpty else {
            return ""
        }
        return prefix(1).uppercased() + dropFirst()
    }
    
    var toDotSeparatedLowercase: String {
        // 大文字の前にドットを追加
        var result = reduce("") { result, character in
            if character.isUppercase {
                result + "." + character.lowercased()
            } else {
                result + String(character)
            }
        }
        // 数字の前にドットを追加
        result = result.replacingOccurrences(
            of: "(?<=[a-zA-Z])([0-9])",
            with: ".$1",
            options: .regularExpression
        )
        return result
    }
}
