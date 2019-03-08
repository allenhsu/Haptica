//
//  Haptic.swift
//  Haptica
//
//  Created by Lasha Efremidze on 4/7/17.
//  Copyright © 2017 efremidze. All rights reserved.
//

import UIKit
import AudioToolbox

public enum HapticFeedbackStyle: Int {
    case light, medium, heavy
}

@available(iOS 10.0, *)
extension HapticFeedbackStyle {
    var value: UIImpactFeedbackGenerator.FeedbackStyle {
        return UIImpactFeedbackGenerator.FeedbackStyle(rawValue: rawValue)!
    }
}

public enum HapticFeedbackType: Int {
    case success, warning, error
}

@available(iOS 10.0, *)
extension HapticFeedbackType {
    var value: UINotificationFeedbackGenerator.FeedbackType {
        return UINotificationFeedbackGenerator.FeedbackType(rawValue: rawValue)!
    }
}

public enum Haptic {
    case impact(HapticFeedbackStyle)
    case notification(HapticFeedbackType)
    case selection
    
    // trigger
    public func generate() {
        guard #available(iOS 10, *) else { return }
        
        switch self {
        case .impact(let style):
            switch style {
            case .light:
                AudioServicesPlaySystemSound(1519)
            case .medium:
                AudioServicesPlaySystemSound(1519)
            case .heavy:
                AudioServicesPlaySystemSound(1520)
            }
//            let generator = UIImpactFeedbackGenerator(style: style.value)
//            generator.prepare()
//            generator.impactOccurred()
        case .notification(let type):
            switch type {
            case .success:
                Haptic.play(".-O", delay: 0.1)
            case .warning:
                Haptic.play("O-.", delay: 0.1)
            case .error:
                Haptic.play(".-.-O-.", delay: 0.1)
            }
//            let generator = UINotificationFeedbackGenerator()
//            generator.prepare()
//            generator.notificationOccurred(type.value)
        case .selection:
            AudioServicesPlaySystemSound(1519)
//            let generator = UISelectionFeedbackGenerator()
//            generator.prepare()
//            generator.selectionChanged()
        }
    }
}
