//  Created by Adli Raihan on 29/07/22.
import Foundation
import SwiftUI
final class DashboardViewModel: ObservableObject {
    @Published var reset: Bool = false

    func logOut() {
//        UDManager.username = nil
//        NavigatorShared.activeInstance!.topStackView = .userLogin
        Network()
            .connect(
                destination: .networkTest,
                method: .get,
                response: NetworkTestModel.self
            ) { result in
            
        }
    }
}
struct NetworkTestModel: Decodable {
    var result: String?
}
