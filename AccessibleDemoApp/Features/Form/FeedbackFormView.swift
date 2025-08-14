//
//  FeedbackFormView.swift
//  AccessibleDemoApp
//
//  Created by Mikel Valle on 13/8/25.
//

import SwiftUI

struct FeedbackFormView: View {
    @State private var email = ""
    @State private var comments = ""
    @State private var subscribe = false

    var body: some View {
        Form {
            Section("Contacto") {
                TextField("Email", text: $email)
                    .textContentType(.emailAddress)
                    .keyboardType(.emailAddress)
                Toggle("Suscribirme a novedades", isOn: $subscribe)
            }
            Section("Comentarios") {
                TextEditor(text: $comments)
                    .frame(minHeight: 120)
                    .accessibilityLabel(Text("Comentarios"))
                    .accessibilityHint(Text("Escribe tu feedback"))
            }
            Section {
                Button("Enviar") { /* validar y enviar */ }
                    .frame(maxWidth: .infinity, minHeight: 44)
                    .A11yButton(label: "Enviar formulario", hint: "Envía el feedback")
            }
        }
        .navigationTitle("Feedback")
        .dynamicTypeSize(.xSmall ... .accessibility5)
    }
}

#Preview {
    FeedbackFormView()
}
