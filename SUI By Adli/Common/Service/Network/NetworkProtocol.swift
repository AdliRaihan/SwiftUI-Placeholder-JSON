//  Created by Adli Raihan on 31/07/22.
import Foundation
enum NetworkCallback<T: Decodable> {
    case success(T)
    case failed(T)
}

enum NetworkMethod {
    case post, get
}

protocol NetworkProtocol {
    func connect<T: Decodable>(
        destination: NetworkPath,
        method: NetworkMethod,
        response: T.Type,
        callback: @escaping ((NetworkCallback<T>) -> Void)
    )
}
extension NetworkProtocol {
    
}
