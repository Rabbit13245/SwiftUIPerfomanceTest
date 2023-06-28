//
//  DonutArray.swift
//  SwiftUIPerfomanceTest
//
//  Created by Dmitriy Zaytsev on 28.06.2023.
//

import SwiftUI

@Observable class DonutForArray: Identifiable {
    var name: String = ""

    init(name: String) {
        self.name = name
    }

    static var all: [DonutForArray] {
        return Donut.all.map { DonutForArray(name: $0.name) }
    }
}

struct DonutArray: View {
    var donuts: [DonutForArray] = DonutForArray.all
    var body: some View {
        List(donuts) { donut in
            HStack {
                Text(donut.name)
                Spacer()
                Button("Randomize") {
                    donut.name = String.random()
                }
            }
            .padding()
            .background(.debug)
        }
    }
}
