//
//  ObservableExample.swift
//  SwiftUIPerfomanceTest
//
//  Created by Dmitriy Zaytsev on 28.06.2023.
//

import SwiftUI


class Store {
    @ObservationTracked var a = 10
    @ObservationTracked var b = 20
    @ObservationTracked var c = 20
    
    
    @ObservationIgnored private let _$observationRegistrar = ObservationRegistrar()
    
    internal nonisolated func access<Member>(
        keyPath: KeyPath<Store , Member>
    ) {
        _$observationRegistrar.access(self, keyPath: keyPath)
    }
    
    internal nonisolated func withMutation<Member, T>(
        keyPath: KeyPath<Store , Member>,
        _ mutation: () throws -> T
    ) rethrows -> T {
        try _$observationRegistrar.withMutation(of: self, keyPath: keyPath, mutation)
    }
    
    @ObservationIgnored private var _a  = 10
    
    @ObservationIgnored private var _b  = 20
    
    @ObservationIgnored private var _c  = 20
}

extension Store : Observable  {}


@Observable class Car {
    var name: String = ""
    var testSubscription: ()? = nil
    var testSubscriptionStore: ()? = nil

    let store = Store()

    var result: Int = 0

    init(
        name: String = "default name"
    ) {
        self.name = name
    }

    func subscribeName() {
        testSubscription = withObservationTracking {
            print(name)
        } onChange: {
            print("name Changed name:\(self.name)")
        }
    }

    func subscribeStore() {
        testSubscriptionStore = withObservationTracking {
            store
        } onChange: {
            print("Store Changed a:\(self.store.a) b:\(self.store.b) c:\(self.store.c)")
        }

        store.c = 100
        // No output
        store.b = 100
        // Output
        // Store Changed a:10 b:20 c:100
        store.a = 100
        // No output
    }

    func changeStore() {
        store.c += 100
    }
}


struct ObservableExample: View {
    let car = Car()

    var body: some View {
        VStack(spacing: 16) {
            Text(car.name)

            Button("change name") {
                car.subscribeName()

                car.name = String.random()
//                DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
//                    car.name = String.random()
//                }
            }

            Button("subscribeStore") {
                car.subscribeStore()
            }

            Button("changeStore") {
                car.changeStore()
            }
        }
        .padding()
    }
}
