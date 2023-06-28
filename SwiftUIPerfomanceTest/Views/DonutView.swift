//
//  DonutView.swift
//  ObservationExample
//
//  Created by Dmitriy Zaytsev on 28.06.2023.
//

import SwiftUI

struct DonutView: View {
    let donut: Donut

    var body: some View {
        HStack(spacing: .zero) {
            Text(donut.name)

            Spacer()

            Text("\(donut.price)")
        }
        .padding()
        .background(.debug)
    }
}
