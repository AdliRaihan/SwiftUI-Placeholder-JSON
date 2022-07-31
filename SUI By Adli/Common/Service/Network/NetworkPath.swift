//  Created by Adli Raihan on 31/07/22.
import Foundation
enum NetworkPath: String {
    case postAPI = "posts"
    case networkTest = ""
}
extension NetworkPath {

    var base: String { return "https://jsonplaceholder.typicode.com/"}

    var path: String { base.appending(self.rawValue) }

    var getHeader: Dictionary<String, Any> {
        switch self {
        default: return [:]
        }
    }

    var getParameter: Dictionary<String, Any> {
        switch self {
        default: return [:]
        }
    }
}
