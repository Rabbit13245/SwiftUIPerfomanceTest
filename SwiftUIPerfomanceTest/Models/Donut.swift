//
//  Donut.swift
//  SwiftUIPerfomanceTest
//
//  Created by Dmitriy Zaytsev on 28.06.2023.
//

import SwiftUI

class State1: ObservableObject {

}

class SuperState: ObservableObject {
    let state1: State1
    let state2: State2
    let state3: State3
}



struct Donut: Identifiable {
    var id: UUID = UUID()
    var name: String
    var price: Int


    init(
        name: String = "",
        price: Int = -1
    ) {
        self.name = name
        self.price = price
    }

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
    @Published var name = ""

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

    func changeName() {
        name = String.random()
    }
}

@Observable class FoodTruckModelObservation {
    var donuts = Donut.all
    var name = ""

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

    func changeName() {
        name = String.random()
    }
}

