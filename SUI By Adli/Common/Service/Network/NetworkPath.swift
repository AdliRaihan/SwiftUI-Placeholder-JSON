//  Created by Adli Raihan on 31/07/22.
import Foundation
enum NetworkPath {
    case networkTest
}
extension NetworkPath {

    var base: String { return "https://jsonplaceholder.typicode.com/"}

    var getHeader: Dictionary<String, Any> {
        switch self {
        default: return [:]
        }
    }

    var getPath: String {
        var endpoint: String
        switch self {
        case .networkTest: endpoint = "todos/1"
        default: endpoint = ""
        }
        return base.appending(endpoint)
    }

    var getParameter: Dictionary<String, Any> {
        switch self {
        default: return [:]
        }
    }
}
