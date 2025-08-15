//
//  A11Helpers.swift
//  AccessibleDemoApp
//
//  Created by Mikel Valle on 13/8/25.
//

import SwiftUI

// MARK: - View Extensions
extension View {
    /// Atributos comunes de accesibilidad para botones + área táctil mínima
    func A11yButton(label: String, hint: String? = nil) -> some View {
        self
            .accessibilityLabel(Text(label))
            .accessibilityAddTraits(.isButton)
            .accessibilityHint(Text(hint ?? ""))
            .frame(minWidth: 44, minHeight: 44)
            .contentShape(Rectangle())
    }
}

// MARK: - Animation Helpers
/// Respeta Reduce Motion en animaciones
@inline(__always)
func withSafeAnimation(_ reduce: Bool, _ changes: @escaping () -> Void) {
    if reduce { changes() } else { withAnimation(.spring()) { changes() } }
}
