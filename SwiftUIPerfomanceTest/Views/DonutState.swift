//
//  DonutState.swift
//  SwiftUIPerfomanceTest
//
//  Created by Dmitriy Zaytsev on 28.06.2023.
//

import SwiftUI

// Пример с WWDC не собирается
//struct DonutState: View {
//    let model = FoodTruckModelObservation()
//    @State private var donutToAdd: Donut?
//
//    var body: some View {
//        List(model.donuts) { DonutView(donut: $0) }
//        Button("Add Donut") { donutToAdd = Donut() }
//            .sheet(item: $donutToAdd) {
//                TextField("Name", text: $donutToAdd.name)
//                Button("Save") {
//                    model.donuts.append(donutToAdd)
//                    donutToAdd = nil
//                }
//                Button("Cancel") { donutToAdd = nil }
//            }
//    }
//}

struct DonutState: View {
    let model = FoodTruckModelObservation()
    @State private var donutToAdd: Donut?

    var donutName: Binding<String> {
        Binding<String>(
            get: { self.donutToAdd?.name ?? "" },
            set: { self.donutToAdd?.name = $0 }
        )
    }

    var body: some View {
        VStack(spacing: 16) {
            List(model.donuts) {
                DonutView(donut: $0)
            }

            Button("Add Donut") { donutToAdd = Donut() }
                .sheet(item: $donutToAdd) { _ in
                    VStack(spacing: 16) {
                        TextField("Name", text: donutName)
                        Button("Save") {
                            if let donut = donutToAdd {
                                model.donuts.append(donut)
                            }
                            donutToAdd = nil
                        }
                        Button("Cancel") { donutToAdd = nil }
                    }
                    .padding()
                }
        }
    }
}
