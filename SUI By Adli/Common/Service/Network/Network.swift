//  Created by Adli Raihan on 31/07/22.
import Foundation
final class Network: NetworkProtocol {
    func connect<T>(
        destination: NetworkPath,
        method: NetworkMethod,
        response: T.Type,
        callback: @escaping ((NetworkCallback<T>) -> Void)
    ) where T : Decodable {
        guard let url = URL.init(string: destination.getPath) else { return }
        
        URLSession(
            configuration: .default
        ).dataTask(
            with: url) { data, response, error in
                if let data = data, let json = try? JSONSerialization.jsonObject(with: data, options: .mutableContainers) {
                    let jsonData = try? JSONSerialization.data(withJSONObject: json, options: .prettyPrinted)
                    if let jsonData = jsonData {
                        print("Adli: Response url \(url) with \(String(describing: response)) From BE \(String(decoding: jsonData, as: UTF8.self))")
                    } else {
                        print("Adli: Failed url \(url) with \(String(describing: response))")
                    }
                } else {
                    print("Adli: No Response for url \(url) with \(String(describing: response))")
                }
            }.resume()
    }
}
