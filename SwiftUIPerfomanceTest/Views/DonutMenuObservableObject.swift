//
//  DonutMenuObservableObject.swift
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
struct DonutMenuObservableObject: View {
    @StateObject var model = FoodTruckModelObservableObject()

    var body: some View {
        let _ = Self._printChanges()
        VStack {
            List {
                Section("Пончики") {
                    ForEach(model.donuts) { donut in
                        DonutView(donut: donut)
                    }
                    Button("Добавить новый пончик") {
                        model.addDonut()
                    }
                    Button("Повысить цены") {
                        model.increasePrice()
                    }
                    Button("Повысить цену клубничного") {
                        model.increasePriceStrawberry()
                    }
                }

                TestText(text: "Some text")

                localView
                    .padding()
                    .background(.debug)
            }
            .listStyle(.plain)
        }
        .background(.debug)
    }

    var localView: some View {
        TestText(text: "LocalView")
    }
}
