//
//  HomeListView.swift
//  AccessibleDemoApp
//
//  Created by Mikel Valle on 13/8/25.
//

import SwiftUI

struct HomeListView: View {
    // MARK: - Properties
    @State private var items: [Item] = demoItems
    @State private var selectedItem: Item? = nil

    // MARK: - Private Methods
    private func deleteItem(_ item: Item) {
        if let idx = items.firstIndex(where: { $0.id == item.id }) {
            items.remove(at: idx)
            HapticManager.notification(.success)
        }
    }

    // MARK: - Body
    var body: some View {
        List {
            Section("Tareas") {
                ForEach(items) { item in
                    ItemRowView(item: item, onDelete: { deleteItem(item) })
                        .contentShape(Rectangle())
                        .onTapGesture {
                            HapticManager.impact(.light)
                            selectedItem = item
                        }
                        .accessibilityHint("Toca para ver detalles")
                }
                .onDelete { indexSet in items.remove(atOffsets: indexSet) }
            }
            .accessibilityAddTraits(.isHeader)
        }
        .navigationDestination(item: $selectedItem) { item in
            DetailView(item: item)
        }
        .navigationTitle("Lista")
        .toolbar {
            ToolbarItemGroup(placement: .topBarTrailing) {
                NavigationLink("Ajustes") { SettingsView() }
                    .simultaneousGesture(TapGesture().onEnded{ HapticManager.impact(.medium)})
                NavigationLink("Auditoría") { A11yChecklistView() }
                    .simultaneousGesture(TapGesture().onEnded{ HapticManager.impact(.medium)})
            }
        }
    }
}

// MARK: - Preview
#Preview {
    HomeListView()
}
