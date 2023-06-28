//
//  MainView.swift
//  SwiftUIPerfomanceTest
//
//  Created by Dmitriy Zaytsev on 28.06.2023.
//

import SwiftUI

struct MainView: View {
    var body: some View {
        NavigationView {
            List {
                NavigationLink("ObservableObject simple") {
                    DonutMenuSimple()
                        .navigationTitle("ObservableObject simple")
                        .navigationBarTitleDisplayMode(.inline)
                }
                NavigationLink("ObservableObject simple with outer wrapper VStack") {
                    VStack(spacing: 16) {
                        Spacer().frame(width: 30, height: 30)
                            .background(.debug)

                        DonutMenuSimple()
                    }
                    .padding()
                    .background(.debug)
                    .navigationTitle("ObservableObject simple")
                    .navigationBarTitleDisplayMode(.inline)
                }
                NavigationLink("ObservableObject List") {
                    DonutMenuWithObservableObject()
                        .navigationTitle("ObservableObject List")
                        .navigationBarTitleDisplayMode(.inline)
                }
            }
            .navigationTitle("Examples")
        }
    }
}
