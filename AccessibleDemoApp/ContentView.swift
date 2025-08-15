//
//  ContentView.swift
//  AccessibleDemoApp
//
//  Clean root menu after modularization
//

import SwiftUI
import UIKit

struct ContentView: View {
    // MARK: - Properties
    private enum A11yFocus: Hashable { case header }
    @AccessibilityFocusState private var a11yFocus: A11yFocus?
    
    // MARK: - Body
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
            .onAppear {
                if UIAccessibility.isVoiceOverRunning {
                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.15) {
                        a11yFocus = .header
                        UIAccessibility.post(notification: .announcement, argument: "Accessible Demo. Menú principal.")
                    }
                }
            }
            .onReceive(NotificationCenter.default.publisher(for: UIAccessibility.voiceOverStatusDidChangeNotification)) { _ in
                if UIAccessibility.isVoiceOverRunning {
                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.15) {
                        a11yFocus = .header
                        UIAccessibility.post(notification: .announcement, argument: "Accessible Demo. Menú principal.")
                    }
                }
            }
        }
    }
}

// MARK: - Preview
#Preview {
    ContentView()
}
