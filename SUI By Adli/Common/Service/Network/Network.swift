//  Created by Adli Raihan on 31/07/22.
import Foundation
final class Network: NetworkProtocol {

    static var shared = Network()

    func connect<T>(
        destination: NetworkPath,
        method: NetworkMethod,
        expectedData: T.Type,
        callback: @escaping ((NetworkCallback<T>) -> Void)
    ) where T : Decodable {
        guard let url = URL.init(string: destination.path) else { return }
        
        URLSession(
            configuration: .default
        ).dataTask(
            with: url) { [weak self] data, response, error in

                guard self != nil else { return }

                if let error = error {
                    callback(.failed(error: error))
                    return
                }

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

                DispatchQueue.main.async { [weak self] in
                    guard self != nil else { return }
                    do {
                        guard let data = data else { throw NSError(domain: "ERROR", code: -1, userInfo: [:]) }
                        let model = try JSONDecoder().decode(expectedData, from: data)
                        callback(.success(model))
                    } catch (let convertError) {
                        callback(.failed(error: convertError))
                    }
                }
            }.resume()
    }
}
