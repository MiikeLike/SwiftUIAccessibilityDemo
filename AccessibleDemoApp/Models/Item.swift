//
//  Item.swift
//  AccessibleDemoApp
//
//  Created by Mikel Valle on 13/8/25.
//


import Foundation

struct Item: Identifiable, Equatable {
    let id = UUID()
    var title: String
    var subtitle: String
    var done: Bool
}

let demoItems: [Item] = [
    .init(title: "Comprar leche", subtitle: "Supermercado", done: false),
    .init(title: "Enviar informe", subtitle: "Proyecto A", done: true),
    .init(title: "Llamar al taller", subtitle: "ITV", done: false),
    .init(title: "Pagar recibo", subtitle: "Banco", done: false),
    .init(title: "Revisar pull request", subtitle: "Repo cliente", done: true)
]

#if DEBUG
// MARK: - Preview Fixtures
extension Item {
    static let previewPending = Item(
        title: "Comprar leche",
        subtitle: "Supermercado",
        done: false
    )

    static let previewDone = Item(
        title: "Enviar informe",
        subtitle: "Proyecto A",
        done: true
    )

    static let previewLongTitle = Item(
        title: "Tarea con un título extraordinariamente largo para comprobar truncado y Dynamic Type",
        subtitle: "Subtítulo también largo para validar múltiples líneas y accesibilidad",
        done: false
    )
}
#endif
