//  Created by Adli Raihan on 29/07/22.
import Foundation
protocol LocalizationManager { }

// Bridge
final class Localization: LocalizationManager {
    public static var instance = Localization()
    init() { }
}

extension String: LocalizationManager {
    public var localized: String { NSLocalizedString("\(self)", comment: self) }
}

extension LocalizationManager {
    static var btnContinue: String { "BTN_CONTINUE".localized }
    static var confimartion: String { "BODY_CONFIRMATION".localized }
    static var username: String { "BODY_USERNAME".localized }
    static var enterUsername: String { "BODY_ENTER_USERNAME".localized }
    static var usernameError: String { "BODY_USERNAME_ERROR".localized }
}
