//
//  ItemRowView.swift
//  AccessibleDemoApp
//
//  Created by Mikel Valle on 13/8/25.
//

import SwiftUI

struct ItemRowView: View {
    let item: Item

    var body: some View {
        HStack(spacing: 12) {
            Image(systemName: item.done ? "checkmark.circle.fill" : "circle")
                .accessibilityHidden(true)
            VStack(alignment: .leading) {
                Text(item.title).font(.title3)
                Text(item.subtitle).font(.subheadline).foregroundStyle(.secondary)
            }
            Spacer()
            Button {
                // Second Action
            } label: {
                Image(systemName: "trash").padding(10)
            }
            .accessibilityLabel(Text("Eliminar \(item.title)"))
            .accessibilityHint(Text("Quita el elemento de la lista"))
        }
        .frame(minHeight: 44)
        .contentShape(Rectangle())
        .accessibilityElement(children: .combine)
        .accessibilityLabel(Text("\(item.title). \(item.done ? "Completado" : "Pendiente"). \(item.subtitle)"))
        .accessibilityAddTraits(.isButton)
    }
}

#Preview("Default - Pending") {
    ItemRowView(item: .previewPending)
        .padding()
}

#Preview("Done state") {
    ItemRowView(item: .previewDone)
        .padding()
}

#Preview("Dynamic Type XXL") {
    ItemRowView(item: .previewLongTitle)
        .padding()
        .environment(\.sizeCategory, .accessibilityExtraExtraExtraLarge)
}

#Preview("Dark Mode") {
    ItemRowView(item: .previewPending)
        .padding()
        .preferredColorScheme(.dark)
}

#Preview("RTL - Árabe") {
    ItemRowView(item: .previewPending)
        .padding()
        .environment(\.layoutDirection, .rightToLeft)
}
