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
                    VStack {
                        Text("Loaded Data")
                            .textToLeft()
                            .font(.caption)
                            .foregroundColor(.gray)
                        Text("\(self.$viewModel.postData.wrappedValue.count)")
                            .font(.largeTitle.bold())
                            .textToLeft()
                    }
                    boxDashboardInfo
                    ForEach.init(self.$viewModel.postData) {
                        PostModelRow(title: $0.title, description: $0.body, id: $0.id)
                    }
                }.padding(.mSize)
            }
            .themeable()
            .navigationViewStyle(.stack)
            .navigationBarHidden(true)
        }.onAppear {
            self.viewModel.getPosts()
        }
    }
}
