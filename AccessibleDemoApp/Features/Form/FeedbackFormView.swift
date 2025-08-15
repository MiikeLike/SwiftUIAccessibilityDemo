//
//  FeedbackFormView.swift
//  AccessibleDemoApp
//
//  Created by Mikel Valle on 13/8/25.
//

import SwiftUI
import UIKit

struct FeedbackFormView: View {
    // MARK: - Properties
    @State private var email = ""
    @State private var comments = ""
    @State private var subscribe = false
    @State private var emailError: String? = nil
    @State private var commentsError: String? = nil
    
    @State private var showSuccessAlert = false
    
    @FocusState private var focusedField: Field?
    @AccessibilityFocusState private var a11yFocus: Field?
    
    private enum Field: Hashable { case email, comments, submit }
    
    // MARK: - Private Methods
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

    private func submitForm() {
        if validateForm() {
            HapticManager.notification(.success)
            announce("Formulario enviado correctamente")
            showSuccessAlert = true
            resetForm()
        } else {
            HapticManager.notification(.error)
            
            var messages: [String] = []
            if let emailError {
                messages.append(emailError)
                focusedField = .email
                a11yFocus = .email
            }
            if let commentsError {
                messages.append(commentsError)
                if focusedField == nil {
                    focusedField = .comments
                    a11yFocus = .comments
                }
            }
            if !messages.isEmpty {
                announce(messages.joined(separator: ". "))
            }
        }
    }
    
    // MARK: - Body
    var body: some View {
        Form {
            // MARK: - Contact Section
            Section("Contacto") {
                TextField("Email", text: $email)
                    .textContentType(.emailAddress)
                    .keyboardType(.emailAddress)
                    .textInputAutocapitalization(.never)
                    .autocorrectionDisabled(true)
                    .submitLabel(.next)
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
            
            // MARK: - Comments Section
            Section("Comentarios") {
                TextEditor(text: $comments)
                    .frame(minHeight: 120)
                    .accessibilityLabel(Text("Comentarios"))
                    .accessibilityHint(Text("Escribe tu feedback"))
                    .focused($focusedField, equals: .comments)
                    .accessibilityFocused($a11yFocus, equals: .comments)
                    .accessibilityAction(.escape) { focusedField = nil }
                if let commentsError {
                    Text(commentsError)
                        .font(.footnote)
                        .foregroundStyle(.red)
                        .accessibilityLabel(Text("Error en comentarios: \(commentsError)"))
                }
            }
            
            // MARK: - Submit Section
            Section {
                Button("Enviar") {
                    submitForm()
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
            if focusedField == .email {
                focusedField = .comments
            } else {
                submitForm()
            }
        }
        .alert("Enviado", isPresented: $showSuccessAlert) {
            Button("OK", role: .cancel) {}
        } message: {
            Text("Formulario enviado correctamente. Gracias por tu feedback.")
        }
        .toolbar {
            ToolbarItemGroup(placement: .keyboard) {
                Button("Ocultar teclado") { focusedField = nil }
                Spacer()
                Button("Enviar") { submitForm() }
                    .accessibilityLabel("Enviar formulario")
                    .accessibilityHint("Envía el feedback")
            }
        }
    }
}

// MARK: - Preview
#Preview {
    FeedbackFormView()
}
