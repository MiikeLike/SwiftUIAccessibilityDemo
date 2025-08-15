//
//  A11yChecklistView.swift
//  AccessibleDemoApp
//
//  Created by Mikel Valle on 13/8/25.
//

import SwiftUI

struct A11yChecklistView: View {
    // MARK: - Properties
    private let items: [(title: String, detail: String)] = [
        ("VoiceOver", "Labels, Hints, Traits y orden lógico de foco"),
        ("Dynamic Type", "Estilos preferidos y layouts adaptables"),
        ("Contraste", "Colores semánticos y no solo color"),
        ("Tamaño táctil", ">= 44×44pt en todos los interactuables"),
        ("Gestos", "Alternativas accesibles a cada gesto"),
        ("Reduce Motion", "Respeta preferencias del usuario")
    ]

    // MARK: - Body
    var body: some View {
        List {
            ForEach(items.indices, id: \.self) { index in
                let item = items[index]
                HStack {
                    Image(systemName: "checkmark.seal")
                        .foregroundStyle(.tint)
                        .accessibilityHidden(true)
                    VStack(alignment: .leading) {
                        Text(item.title).font(.headline)
                        Text(item.detail).font(.subheadline).foregroundStyle(.secondary)
                    }
                }
                .frame(minHeight: 44)
                .accessibilityElement(children: .combine)
                .accessibilityLabel(Text("\(item.title). \(item.detail)"))
            }
        }
        .navigationTitle("Auditoría A11y")
    }
}

// MARK: - Preview
#Preview {
    A11yChecklistView()
}
