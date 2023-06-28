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
                    DonutMenuObservableObjectSimple()
                        .navigationTitle("ObservableObject simple")
                        .navigationBarTitleDisplayMode(.inline)
                }
                NavigationLink("ObservableObject simple with outer wrapper VStack") {
                    VStack(spacing: 16) {
                        Spacer().frame(width: 30, height: 30)
                            .background(.debug)

                        DonutMenuObservableObjectSimple()
                    }
                    .padding()
                    .background(.debug)
                    .navigationTitle("ObservableObject simple with outer wrapper VStack")
                    .navigationBarTitleDisplayMode(.inline)
                }
                NavigationLink("ObservableObject List") {
                    DonutMenuWithObservableObject()
                        .navigationTitle("ObservableObject List")
                        .navigationBarTitleDisplayMode(.inline)
                }
                NavigationLink("Observation simple") {
                    DonutMenuWithObservationSimple()
                        .navigationTitle("Observation List")
                        .navigationBarTitleDisplayMode(.inline)
                }
                NavigationLink("Observation List") {
                    DonutMenuWithObservation()
                        .navigationTitle("Observation List")
                        .navigationBarTitleDisplayMode(.inline)
                }
                NavigationLink("@State") {
                    DonutState()
                        .navigationTitle("@State")
                        .navigationBarTitleDisplayMode(.inline)
                }
                NavigationLink("@Bindable") {
                    DonutBindable()
                        .navigationTitle("@Bindable")
                        .navigationBarTitleDisplayMode(.inline)
                }
                NavigationLink("DonutArray") {
                    DonutArray()
                        .navigationTitle("DonutArray")
                        .navigationBarTitleDisplayMode(.inline)
                }
                NavigationLink("ObservableExample") {
                    ObservableExample()
                        .navigationTitle("ObservableExample")
                        .navigationBarTitleDisplayMode(.inline)
                }
            }
            .navigationTitle("Examples")
        }
    }
}
