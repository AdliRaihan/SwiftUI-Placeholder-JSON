//  Created by Adli Raihan on 29/07/22.
import Foundation
protocol UDManagerProtocol {
    static var username: String? { get set }
}
extension UDManagerProtocol {
    static var usernameKey: String { "UsernameKey"}
}
class UDManager: UDManagerProtocol {
    public static var shared = UserDefaults.standard

    static var username: String? {
        get {
            UDManager.shared.string(forKey: usernameKey)
        }
        set {
            print("Username get setted with value \(newValue ?? "{Reset}")")
            UDManager.shared.set(newValue, forKey: usernameKey)
        }
    }
}
