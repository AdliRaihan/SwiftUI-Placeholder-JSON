//  Created by Adli Raihan on 28/07/22.
import Foundation
import SwiftUI
struct LoginView: SUIRouterProtocol {
    @ObservedObject var viewModel = LoginViewModel()
    @State var buttonContinueTitle: String = Localization.btnContinue

    private var header: some View {
        VStack.init(alignment: .leading, spacing: 0) {
            Text("SUI By Adli")
                .font(.title.bold())
                .fixedSize()
                .frame(maxWidth: .infinity, alignment: .leading)
            Text("Swift UI Application Demo Build ID 29202207")
                .font(.caption)
                .frame(maxWidth: .infinity, alignment: .leading)
                .foregroundColor(.gray)
        }.frame(maxWidth: .infinity)
            .padding(.mSize)
    }

    private var boxLogin: some View {
        VStack.init(alignment: .leading) {

            SUITextFieldView.init(
                title: Localization.enterUsername,
                marginBottom: .mSize,
                text: $viewModel.usernameValue,
                errorText: $viewModel.usernameError
            )
            
            SUIButtonView(
                someAction: { _ in
                    self.viewModel.validateForm()
                },
                appliedTitle: self.$buttonContinueTitle
            ).classicTheme()

        }.padding([.leading, .trailing], .mSize)
    }
    
    var body: some View {
        NavigationView.init {
            ScrollView {
                VStack(alignment: .leading, spacing: 0) {
                    header
                    boxLogin
                }
            }.onTapGesture {
                UIApplication.shared.restoreKeyboard()
            }
            .navigationBarHidden(true)
        }
    }
}
