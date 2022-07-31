//  Created by Adli Raihan on 28/07/22.
import Foundation
import SwiftUI
struct SUIButtonView: View {

    public var someAction: ((SUIButtonView) -> Void)?
    @Binding public var appliedTitle: String

    var body: some View {
        VStack {
            Button.init {
                someAction?(self)
            } label: {
                VStack {
                    Text(appliedTitle)
                        .frame(maxWidth: .infinity)
                        .font(.body)
                }
            }
        }
        .padding([.top, .bottom], .xmSize)
        .frame(maxWidth: .infinity)
    }
}

extension SUIButtonView {
    func classicTheme() -> some View {
        self.background(.black)
            .foregroundColor(.white)
            .frame(
                maxWidth: .infinity,
                idealHeight: .xlSize
            )
            .cornerRadius(.sSize)
    }
}
