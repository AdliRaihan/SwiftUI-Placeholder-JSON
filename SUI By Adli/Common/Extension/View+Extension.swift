//  Created by Adli Raihan on 31/07/22.
import Foundation
import SwiftUI
extension View {
    func makeBoxShadow(
        backgroundColor: Color,
        shadowColor: Color = .gray,
        cornerRadius: CGFloat = .xsSize,
        xPos: CGFloat = 0,
        yPos: CGFloat = 0
    ) -> some View {
        self.background(
            EmptyView().background(
                EmptyView()
                    .background(backgroundColor)
                    .cornerRadius(cornerRadius)
            ).background(
                .black.opacity(0)
            ).shadow(color: .black.opacity(0.1), radius: cornerRadius, x: xPos, y: yPos)
        )
    }

    func textToLeft() -> some View {
        self.frame(
                maxWidth: .infinity,
                alignment: .leading
            )
    }

    func themeable() -> some View {
        // Add logic later
        self
            .background(.white)
            .foregroundColor(.black)
    }
}
