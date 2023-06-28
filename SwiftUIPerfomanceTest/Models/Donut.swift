//
//  Donut.swift
//  SwiftUIPerfomanceTest
//
//  Created by Dmitriy Zaytsev on 28.06.2023.
//

import SwiftUI

struct Donut: Identifiable {
    var id: UUID = UUID()
    var name: String
    var price: Int

    static let donuts = [
        Donut(name: "Клубничный", price: 100),
        Donut(name: "Шоколадный", price: 110),
        Donut(name: "Карамельный", price: 120)
    ]

    static var all: [Donut] {
        return donuts
    }
}

class FoodTruckModelObservableObject: ObservableObject {
    @Published var donuts = Donut.all

    func addDonut() {
        donuts.append(Donut(name: "Ванильный", price: 200))
    }

    func increasePrice() {
        donuts = donuts.map {
            Donut(name: $0.name, price: Int(Double($0.price) * 1.2))
        }
    }

    func increasePriceStrawberry() {
        donuts = donuts.map { donut in
            guard donut.name == "Клубничный" else { return donut }
            var donut = donut
            donut.price = Int(Double(donut.price) * 1.2)
            return donut
        }
    }
}

@Observable class FoodTruckModelObservation {
    var donuts = Donut.all

    func addDonut() {
        donuts.append(Donut(name: "Ванильный", price: 200))
    }
}

