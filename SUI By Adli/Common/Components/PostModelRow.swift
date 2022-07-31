//  Created by Adli Raihan on 31/07/22.
import Foundation
import SwiftUI
struct PostModelRow: View {
    @Binding public var title: String?
    @Binding public var description: String?
    @Binding public var id: Int?
    
    var body: some View {
        VStack {
            VStack {
                Text(self.title ?? "")
                    .textToLeft()
                    .font(.body.bold())
                    .padding([.bottom], .xsSize)
                Text(self.description?.replacingOccurrences(of: "\n", with: " ") ?? "")
                    .textToLeft()
                    .font(.caption)
            }
            .padding(.sSize)
            .makeBoxShadow(backgroundColor: .white)
        }
        .padding([.bottom], .sSize)
    }
}
