//
//  ContentView.swift
//  AccessibleDemoApp
//
//  Clean root menu after modularization
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationStack {
            List {
                Section("Demostraciones") {
                    NavigationLink("Lista de tareas (A11y)") { HomeListView() }
                    NavigationLink("Detalle (Zoom + Reduce Motion)") { DetailView() }
                    NavigationLink("Formulario accesible") { FeedbackFormView() }
                }
                Section("Herramientas") {
                    NavigationLink("Ajustes (Guía de pruebas)") { SettingsView() }
                    NavigationLink("Auditoría de Accesibilidad") { A11yChecklistView() }
                }
            }
            .navigationTitle("Accessible Demo")
        }
    }
}

#Preview {
    ContentView()
}
