//  Created by Adli Raihan on 31/07/22.
import Foundation
final class PostModel: Decodable, Identifiable {
    var userId: Int?
    var id: Int?
    var title: String?
    var body: String?
    enum CodingKeys: String, CodingKey {
        case userId = "user_id"
        case id
        case title
        case body
    }
}
