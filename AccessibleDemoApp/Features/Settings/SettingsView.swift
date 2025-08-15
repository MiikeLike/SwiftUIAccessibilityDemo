//
//  SettingsView.swift
//  AccessibleDemoApp
//
//  Created by Mikel Valle on 13/8/25.
//

import SwiftUI

struct SettingsView: View {
    // MARK: - Body
    var body: some View {
        List {
            // MARK: - VoiceOver Section
            Section("VoiceOver") {
                Text("Actívalo en Ajustes → Accesibilidad → VoiceOver. Recorre Home, entra a Detalle y Formulario.")
            }
            
            // MARK: - Dynamic Type Section
            Section("Tamaño de texto (Dynamic Type)") {
                Text("Ajustes → Accesibilidad → Pantalla y tamaño de texto → Tamaño del texto. Prueba hasta Accesibilidad 5.")
            }
            
            // MARK: - Reduce Motion Section
            Section("Reduce Motion") {
                Text("Ajustes → Accesibilidad → Movimiento → Reducir movimiento. En Detalle verás transiciones sin animación.")
            }
            
            // MARK: - Contrast Section
            Section("Contraste") {
                Text("Verifica contraste en claro/oscuro. No se transmite estado solo por color: hay iconos y texto.")
            }
            
            // MARK: - Gestures Section
            Section("Gestos vs Alternativas") {
                Text("Swipe para borrar en la lista y botón de Eliminar como alternativa.")
            }
        }
        .navigationTitle("Ajustes de prueba")
    }
}

// MARK: - Preview
#Preview {
    SettingsView()
}
