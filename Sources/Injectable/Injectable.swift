//
//  Created by Ain Obara on 2023/09/28.
//

public protocol Injectable {

    static var unimplemented: Self { get }
}

public func withInjection<T>(_ value: () -> T, injection: (inout DependencyValues) -> Void) -> T {
    injection(&dependencyValues)
    return value()
}

public func withTemporaryInjection<T>(_ value: () -> T, injection: (inout DependencyValues) -> Void) -> T {
    var previous = dependencyValues

    injection(&dependencyValues)
    defer {
        dependencyValues = previous
    }
    return value()
}

public func withInjection(injection: (inout DependencyValues) -> Void) {
    injection(&dependencyValues)
}

@propertyWrapper
public struct Injected<T> where T: Injectable {

    private var cache: T

    public var wrappedValue: T {
        cache
    }

    public init() {
        self.cache = dependencyValues[T.self]
    }
}
