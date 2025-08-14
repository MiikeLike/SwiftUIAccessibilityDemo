//
//  HomeListView.swift
//  AccessibleDemoApp
//
//  Created by Mikel Valle on 13/8/25.
//

import SwiftUI

struct HomeListView: View {
    @State private var items: [Item] = demoItems

    var body: some View {
        List {
            Section("Tareas") {
                ForEach(items) { item in
                    NavigationLink {
                        DetailView(item: item)
                    } label: {
                        ItemRowView(item: item)
                    }
                    .accessibilityHint("Toca para ver detalles")
                }
                .onDelete { indexSet in items.remove(atOffsets: indexSet) }
            }
            .accessibilityAddTraits(.isHeader)
        }
        .navigationTitle("Lista")
        .toolbar {
            ToolbarItemGroup(placement: .topBarTrailing) {
                NavigationLink("Ajustes") { SettingsView() }
                NavigationLink("Auditoría") { A11yChecklistView() }
            }
        }
    }
}

#Preview {
    HomeListView()
}

