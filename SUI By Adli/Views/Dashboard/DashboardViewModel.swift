//  Created by Adli Raihan on 29/07/22.
import Foundation
import SwiftUI
final class DashboardViewModel: ObservableObject {
    @Published var reset: Bool = false

    func logOut() {
        Network()
            .connect(
                destination: .networkTest,
                method: .get,
                response: NetworkTestModel.self
            ) { result in
                UDManager.username = nil
                NavigatorShared.activeInstance!.topStackView = .userLogin
            }
    }
}
struct NetworkTestModel: Decodable {
    var result: String?
}
