//
//  DetailView.swift
//  AccessibleDemoApp
//
//  Created by Mikel Valle on 13/8/25.
//

import SwiftUI

struct DetailView: View {
    @Environment(\.accessibilityReduceMotion) private var reduceMotion
    @State private var scale: CGFloat = 1.0
    var item: Item? = nil

    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 16) {
                Image(systemName: "globe")
                    .resizable()
                    .scaledToFit()
                    .frame(maxWidth: .infinity)
                    .padding(.vertical)
                    .scaleEffect(scale)
                    .gesture(MagnificationGesture().onChanged { value in
                        scale = min(max(1.0, value), 3.0)
                    })
                    .accessibilityLabel(Text("Imagen ilustrativa"))

                if let item {
                    Text(item.title).font(.title)
                    Text(item.subtitle).font(.body).foregroundStyle(.secondary)
                } else {
                    Text("Descripción").font(.title)
                    Text("Ejemplo de texto largo para comprobar Dynamic Type y scroll. Ajustes → Accesibilidad → Tamaño del texto.")
                        .font(.body)
                }

                HStack(spacing: 24) {
                    Button("−") { withSafeAnimation(reduceMotion) { scale = max(1.0, scale - 0.2) } }
                        .frame(minWidth: 44, minHeight: 44)
                        .A11yButton(label: "Reducir zoom")
                    Button("+") { withSafeAnimation(reduceMotion) { scale = min(3.0, scale + 0.2) } }
                        .frame(minWidth: 44, minHeight: 44)
                        .A11yButton(label: "Aumentar zoom")
                }
            }
            .padding()
        }
        .navigationTitle(item?.title ?? "Detalle")
        .dynamicTypeSize(.xSmall ... .accessibility5)
    }
}

#Preview {
    DetailView()
}
