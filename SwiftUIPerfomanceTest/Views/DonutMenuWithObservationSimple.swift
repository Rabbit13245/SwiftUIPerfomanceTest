//
//  DonutMenuObservableObject.swift
//  SwiftUIPerfomanceTest
//
//  Created by Dmitriy Zaytsev on 28.06.2023.
//

import SwiftUI

struct DonutMenuWithObservationSimple: View {
    let model = FoodTruckModelObservation()

    var body: some View {
        let _ = Self._printChanges()
        VStack(spacing: 16) {
            DonutView(donut: model.donuts[0])

            DonutView(donut: model.donuts[1])

            DonutView(donut: model.donuts[2])

            Button("Повысить цены") {
                model.increasePrice()
            }
            .background(.debug)

            Button("Повысить цену клубничного") {
                model.increasePriceStrawberry()
            }
            .background(.debug)

            TestText(text: "Some text")

            localView
                .padding()
                .background(.debug)
        }
        .background(.debug)
    }

    var localView: some View {
        TestText(text: "LocalView")
    }
}
