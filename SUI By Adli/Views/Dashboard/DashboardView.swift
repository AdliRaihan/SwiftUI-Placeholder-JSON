//  Created by Adli Raihan on 29/07/22.
import Foundation
import SwiftUI
struct DashboardView: SUIRouterProtocol {

    @ObservedObject var viewModel = DashboardViewModel()
    @State var resetUsername = "Sign out"

    private var usernameValue: String { UDManager.username ?? "" }

    private var boxDashboardInfo: some View {
        HStack {
            VStack.init(alignment: .leading) {
                Text(usernameValue)
                    .frame(
                        maxWidth: .infinity,
                        alignment: .leading
                    )
                Text("Application Tester")
                    .frame(
                        maxWidth: .infinity,
                        alignment: .leading
                    ).font(.caption).foregroundColor(.gray)
            }
            .padding(.sSize)
            
            VStack {
                SUIButtonView.init(someAction: { _ in
                    viewModel.logOut()
                }, appliedTitle: self.$resetUsername)
                    .classicTheme()
            }
            .padding(.sSize)
        }
        .makeBoxShadow(backgroundColor: .white)
        .frame(maxWidth: .infinity)
    }

    var body: some View {
        NavigationView {
            ScrollView {
                VStack.init(alignment: .leading) {
                    boxDashboardInfo
                }.padding(.mSize)
            }.navigationViewStyle(.stack)
                .navigationBarHidden(true)
        }
    }
}
