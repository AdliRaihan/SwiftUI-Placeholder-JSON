//  Created by Adli Raihan on 28/07/22.
import Foundation
import SwiftUI
final class ContentViewModelSecond: ObservableObject {
    @Published var errorField: String?

    func validateForm() {
        self.errorField = "Your name cannot be empty"
    }
}
