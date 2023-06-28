//
//  TestText.swift
//  SwiftUIPerfomanceTest
//
//  Created by Dmitriy Zaytsev on 28.06.2023.
//

import SwiftUI

struct TestText: View {
    let text: String

    var body: some View {
        Text(text)
            .background(.debug)
    }
}
