//  Created by Adli Raihan on 31/07/22.
import Foundation
import SwiftUI
extension View {
    func makeBoxShadow(
        backgroundColor: Color,
        shadowColor: Color = .gray,
        cornerRadius: CGFloat = .xsSize
    ) -> some View {
        self.background(
            EmptyView().background(
                EmptyView()
                    .background(backgroundColor)
                    .cornerRadius(cornerRadius)
            ).background(
                .black.opacity(0)
            ).shadow(color: .black.opacity(0.1), radius: cornerRadius, x: 0, y: 0)
        )
    }
}
