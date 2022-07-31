//  Created by Adli Raihan on 13/07/22.
import Foundation
import SwiftUI

struct SUITextFieldView: View {

    public var title: String

    public var placeHolder: String = ""

    public var marginBottom: CGFloat = 0

    @Binding public var text: String

    @State private var typedText: String = ""

    @Binding public var errorText: String?

    var body: some View {
        VStack(alignment: .leading) {

            Text(
                self.title
            ).font(.callout)

            VStack {
                TextField.init(
                    self.placeHolder,
                    text: self.$typedText
                ).onChange(of: self.typedText) { newValue in
                    print(self.text)
                    if self.typedText.count > 16,
                       !newValue.isEmpty {
                        self.typedText.removeLast()
                    } else {
                        self.text = typedText
                    }
                }
            }
            .padding(EdgeInsets(
                top: .sSize,
                leading: .mSize,
                bottom: .sSize,
                trailing: .sSize))
            .overlay(
                RoundedRectangle(cornerRadius: .xsSize)
                    .stroke(
                        style: StrokeStyle(
                            lineWidth: (errorText != nil) ? 1 : 0.5
                        ))
                    .foregroundColor((errorText != nil) ? .red : .black)
            )

            errorText.publisher.map {
                Text($0)
                    .errorStyle()
            }.output

        }.padding(.bottom, marginBottom)
    }
}

extension Text {
    public func errorStyle() -> Self {
        self.foregroundColor(.red)
            .font(.caption)
    }
}
