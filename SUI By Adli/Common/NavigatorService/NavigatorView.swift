//  Created by Adli Raihan on 31/07/22.
import Foundation
import SwiftUI
struct NavigatorView: View {
    @ObservedObject var objectShared: NavigatorShared = .createInstance()

    var body: some View {
        VStack {
            Text((self.objectShared.topStackView == .userLogin) ? "USER LOGIN" : "NOT LOGIN")

            switch self.$objectShared
                .topStackView
                .wrappedValue {
            case .userWithAuth:
                DashboardView()
            default:
                LoginView()
            }
        }
    }

}
