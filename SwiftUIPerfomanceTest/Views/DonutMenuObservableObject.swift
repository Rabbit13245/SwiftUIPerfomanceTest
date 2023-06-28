//
//  DonutMenuObservableObject.swift
//  SwiftUIPerfomanceTest
//
//  Created by Dmitriy Zaytsev on 28.06.2023.
//

import SwiftUI

struct DonutMenuWithObservableObject: View {
    @StateObject var model = FoodTruckModelObservableObject()

    var body: some View {
        let _ = Self._printChanges()
        VStack(spacing: 16) {
            List {
                Section("Пончики") {
                    ForEach(model.donuts) { donut in
                        DonutView(donut: donut)
                    }

                    Button("Добавить новый пончик") {
                        model.addDonut()
                    }
                    .background(.debug)

                    Button("Повысить все цены") {
                        model.increasePrice()
                    }
                    .background(.debug)

                    Button("Повысить цену клубничного") {
                        model.increasePriceStrawberry()
                    }
                    .background(.debug)

                    Button("Поменять имя") {
                        model.changeName()
                    }
                    .background(.debug)
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
