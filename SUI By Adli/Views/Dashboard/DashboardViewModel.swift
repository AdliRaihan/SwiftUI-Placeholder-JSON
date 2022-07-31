//  Created by Adli Raihan on 29/07/22.
import Foundation
import SwiftUI

final class DashboardViewModel: ObservableObject {
    @Published var reset: Bool = false
    @Published var postData: [PostModel] = []

    func getPosts() {
        Network.shared.connect(
            destination: .postAPI,
            method: .get,
            expectedData: [PostModel].self) { [weak self] in
                guard let self = self else { return }
                switch $0 {
                case .success(let data):
                    self.postData = data
                    print(self.postData)
                case .failed:
                    print("ERROR!")
                }
            }
    }
    func logOut() {
        UDManager.username = nil
        NavigatorShared.activeInstance!.topStackView = .userLogin
    }
}
