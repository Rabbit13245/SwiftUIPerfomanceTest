//
//  DonutMenuObservableObject.swift
//  SwiftUIPerfomanceTest
//
//  Created by Dmitriy Zaytsev on 28.06.2023.
//

import SwiftUI

struct DonutMenuObservableObjectSimple: View {
    @StateObject var model = FoodTruckModelObservableObject()

    var body: some View {
        let _ = Self._printChanges()
        VStack(spacing: 16) {
            DonutView(donut: model.donuts[0])

            DonutView(donut: model.donuts[1])

            DonutView(donut: model.donuts[2])

            Button("Повысить все цены") {
                model.increasePrice()
            }
            .background(.debug)

            Button("Повысить цену клубничного") {
                model.increasePriceStrawberry()
            }

            Button("Поменять имя") {
                model.changeName()
            }
            .background(.debug)

            TestText(text: "Some text")
                .padding()
                .background(.debug)

            localView
                .padding()
                .background(.debug)
        }
        //.background(.debug)
    }

    var localView: some View {
        TestText(text: "LocalView")
    }
}
