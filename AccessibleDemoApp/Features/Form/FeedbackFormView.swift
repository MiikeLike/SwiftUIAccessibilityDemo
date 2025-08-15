//
//  FeedbackFormView.swift
//  AccessibleDemoApp
//
//  Created by Mikel Valle on 13/8/25.
//

import SwiftUI
import UIKit

struct FeedbackFormView: View {
    @State private var email = ""
    @State private var comments = ""
    @State private var subscribe = false
    @State private var emailError: String? = nil
    @State private var commentsError: String? = nil
    
    @State private var showSuccessAlert = false
    
    @FocusState private var focusedField: Field?
    @AccessibilityFocusState private var a11yFocus: Field?
    
    private enum Field: Hashable { case email, comments, submit }
    
    //MARK: - Private Function
    private func isValidEmail(_ text: String) -> Bool {
        // Simple but robust pattern for demo/technical test
        let pattern = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}"
        return NSPredicate(format: "SELF MATCHES %@", pattern).evaluate(with: text)
    }
    
    
    private func resetForm() {
        email = ""
        comments = ""
        subscribe = false
        emailError = nil
        commentsError = nil
        focusedField = nil
        a11yFocus = .submit
    }
    
    private func validateForm() -> Bool {
        emailError = nil
        commentsError = nil
        
        if email.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty {
            emailError = "El email es obligatorio."
        } else if !isValidEmail(email) {
            emailError = "Formato de email no válido."
        }
        
        if comments.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty {
            commentsError = "Los comentarios son obligatorios."
        }
        
        return emailError == nil && commentsError == nil
    }
    
    private func announce(_ message: String) {
        UIAccessibility.post(notification: .announcement, argument: message)
    }
    
    
    var body: some View {
        Form {
            Section("Contacto") {
                TextField("Email", text: $email)
                    .textContentType(.emailAddress)
                    .keyboardType(.emailAddress)
                    .textInputAutocapitalization(.never)
                    .autocorrectionDisabled(true)
                    .focused($focusedField, equals: .email)
                    .accessibilityFocused($a11yFocus, equals: .email)
                if let emailError {
                    Text(emailError)
                        .font(.footnote)
                        .foregroundStyle(.red)
                        .accessibilityLabel(Text("Error en email: \(emailError)"))
                }
                Toggle("Suscribirme a novedades", isOn: $subscribe)
            }
            Section("Comentarios") {
                TextEditor(text: $comments)
                    .frame(minHeight: 120)
                    .accessibilityLabel(Text("Comentarios"))
                    .accessibilityHint(Text("Escribe tu feedback"))
                    .focused($focusedField, equals: .comments)
                    .accessibilityFocused($a11yFocus, equals: .comments)
                if let commentsError {
                    Text(commentsError)
                        .font(.footnote)
                        .foregroundStyle(.red)
                        .accessibilityLabel(Text("Error en comentarios: \(commentsError)"))
                }
            }
            Section {
                Button("Enviar") {
                    if validateForm() {
                        HapticManager.notification(.success)
                        announce("Formulario enviado correctamente")
                        showSuccessAlert = true
                        resetForm()
                    } else {
                        HapticManager.notification(.error)
                        if emailError != nil {
                            focusedField = .email
                            a11yFocus = .email
                            announce(emailError!)
                        } else if commentsError != nil {
                            focusedField = .comments
                            a11yFocus = .comments
                            announce(commentsError!)
                        }
                    }
                }
                .frame(maxWidth: .infinity, minHeight: 44)
                .A11yButton(label: "Enviar formulario", hint: "Envía el feedback")
                .focused($focusedField, equals: .submit)
                .accessibilityFocused($a11yFocus, equals: .submit)
            }
        }
        .navigationTitle("Feedback")
        .dynamicTypeSize(.xSmall ... .accessibility5)
        .submitLabel(.done)
        .onSubmit {
            if focusedField == .email { focusedField = .comments }
        }
        .alert("Enviado", isPresented: $showSuccessAlert) {
            Button("OK", role: .cancel) {}
        } message: {
            Text("Formulario enviado correctamente. Gracias por tu feedback.")
        }
    }
}

#Preview {
    FeedbackFormView()
}
