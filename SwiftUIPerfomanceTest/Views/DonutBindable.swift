//
//  DonutBindable.swift
//  SwiftUIPerfomanceTest
//
//  Created by Dmitriy Zaytsev on 28.06.2023.
//

import SwiftUI

@Observable class EditingDonut {
  var name: String = "default name"
}

struct DonutBindable: View {
    let editingDonut = EditingDonut()

    var body: some View {
        VStack(spacing: 16) {
            Text("Отображение")
                .font(.title)

            Text(editingDonut.name)

            Text("Редактирование")
                .font(.title)

            EditingBindableView(editingDonut: editingDonut)
        }
        .padding()
    }
}

struct EditingBindableView: View {
    @Bindable var editingDonut: EditingDonut

    var body: some View {
        TextField("Name", text: $editingDonut.name)
    }
}
