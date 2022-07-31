//  Created by Adli Raihan on 13/07/22.
import SwiftUI

public protocol SUIRouterProtocol: View {
    init?()
}
public class SUIRouter {
    static func navigate<T: SUIRouterProtocol>(destination: T.Type) -> some View { T.init() }
}
