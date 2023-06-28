//
//  Helpers.swift
//  SwiftUIPerfomanceTest
//
//  Created by Dmitriy Zaytsev on 28.06.2023.
//

import SwiftUI

public extension ShapeStyle where Self == Color {
    static var debug: Color {
    #if DEBUG
        return Color(
            red: .random(in: 0...1),
            green: .random(in: 0...1),
            blue: .random(in: 0...1)
        ).opacity(0.5)
    #else
        return Color(.clear)
    #endif
    }
}

public extension String {
    static func random() -> Self {
        UUID().uuidString
    }
}
