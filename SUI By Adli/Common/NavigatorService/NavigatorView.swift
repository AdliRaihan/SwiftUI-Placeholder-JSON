//  Created by Adli Raihan on 31/07/22.
import Foundation
import SwiftUI
struct NavigatorView: View {
    @ObservedObject var objectShared: NavigatorShared = .createInstance()

    var body: some View {
        VStack {
            VStack.init(alignment: .center) {
                Text(
                    (self.objectShared.topStackView == .userLogin) ? "Login" : "Dashboard")
                    .textToLeft()
                    .font(.body.bold())
                Text("SUI Application")
                    .textToLeft()
                    .font(.caption)
                    .foregroundColor(.gray)
            }
            .padding(.mSize)
            .background(.black)
            .foregroundColor(.white)
            .preferredColorScheme(.dark)

            VStack {
                switch self.$objectShared
                    .topStackView
                    .wrappedValue {
                case .userWithAuth:
                    DashboardView()
                default:
                    LoginView()
                }
            }
            .background(.white)
            .foregroundColor(.black)
        }
    }

}
