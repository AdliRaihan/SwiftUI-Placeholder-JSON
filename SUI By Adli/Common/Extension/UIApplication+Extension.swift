//  Created by Adli Raihan on 28/07/22.
import Foundation
import UIKit
extension UIApplication {
    func restoreKeyboard() {
        sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}
