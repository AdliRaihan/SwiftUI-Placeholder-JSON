//  Created by Adli Raihan on 13/07/22.
import Foundation
import SwiftUI
protocol SUIScreenProtocol: View {
    init?()
}
struct BaseContentView: SUIRouterProtocol {
    var bodyContent: some View {
        Text("Didn't Apply!")
    }

    var body: some View {
        NavigationView.init { bodyContent }
    }
}
