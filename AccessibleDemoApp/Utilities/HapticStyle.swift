//
//  HapticStyle.swift
//  AccessibleDemoApp
//
//  Created by Mikel Valle on 15/8/25.
//


import UIKit

enum HapticStyle {
    case light, medium, heavy
}

final class HapticManager {
    static func impact(_ style: HapticStyle = .light) {
        let generator: UIImpactFeedbackGenerator
        switch style {
        case .light:  generator = UIImpactFeedbackGenerator(style: .light)
        case .medium: generator = UIImpactFeedbackGenerator(style: .medium)
        case .heavy:  generator = UIImpactFeedbackGenerator(style: .heavy)
        }
        generator.prepare()
        generator.impactOccurred()
    }

    static func notification(_ type: UINotificationFeedbackGenerator.FeedbackType) {
        let generator = UINotificationFeedbackGenerator()
        generator.prepare()
        generator.notificationOccurred(type)
    }
}