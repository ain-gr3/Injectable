//
//  Created by Ain Obara on 2023/09/28.
//

import Foundation

internal var dependencyValues = DependencyValues()

public struct DependencyValues {

    var values: [ObjectIdentifier: Injectable] = [:]

    public subscript<T>(_ key: T.Type) -> T where T: Injectable {
        get {
            if let value = values[ObjectIdentifier(key)] as? T {
                return value
            } else {
                #if DEBUG
                return T.unimplemented
                #else
                fatalError()
                #endif
            }
        }
        set {
            values[ObjectIdentifier(key)] = newValue
        }
    }
}
