//
//  SwiftUIPerfomanceTestApp.swift
//  SwiftUIPerfomanceTest
//
//  Created by Dmitriy Zaytsev on 28.06.2023.
//

import SwiftUI

@main
struct SwiftUIPerfomanceTestApp: App {
    var body: some Scene {
        WindowGroup {
            VStack {
                Spacer().frame(width: 30, height: 40)

                DonutMenuObservableObject()
                    .padding()
            }
            .background(.debug)

        }
    }
}
