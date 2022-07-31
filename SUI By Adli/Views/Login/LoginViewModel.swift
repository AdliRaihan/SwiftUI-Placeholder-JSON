//  Created by Adli Raihan on 28/07/22.
import Foundation
import SwiftUI
final class LoginViewModel: ObservableObject {

    @Published var usernameValue: String = ""
    @Published var usernameError: String?

    @Published var pass: Bool = false

    func validateForm() {
        usernameError = (usernameValue.isEmpty) ? Localization.usernameError : nil

        if usernameError == nil {
            UDManager.username = usernameValue
        }

        self.pass = [
            usernameError
        ].filter({ $0 != nil }).count == 0

        if self.pass {
            NavigatorShared.activeInstance?.topStackView = .userWithAuth
        }
    }
}
