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
                NavigationLink("ObservableObject List") {
                    DonutMenuObservableObject()
                        .navigationTitle("ObservableObject List")
                        .navigationBarTitleDisplayMode(.inline)
                }
            }
            .navigationTitle("Examples")
        }
    }
}
