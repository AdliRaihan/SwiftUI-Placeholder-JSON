//  Created by Adli Raihan on 31/07/22.
import Foundation
import SwiftUI
enum TopViewStack {
    case userWithAuth
    case userLogin
}

final class NavigatorShared: ObservableObject {

    @Published var topStackView: TopViewStack = .userLogin
    public static var activeInstance: NavigatorShared?

    public class func createInstance() -> NavigatorShared {
        let navigatorShared = NavigatorShared()
        navigatorShared.topStackView = (UDManager.username == nil) ? .userLogin : .userWithAuth
        NavigatorShared.activeInstance = navigatorShared
        return NavigatorShared.activeInstance!
    }
}
