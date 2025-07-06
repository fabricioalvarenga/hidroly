//
//  Extension+Observable.swift
//  Hidroly
//
//  Created by FABRICIO ALVARENGA on 05/07/25.
//

import Foundation
import Combine

extension ObservableObject where Self.ObjectWillChangePublisher == ObservableObjectPublisher {
    func subscribe<T: ObservableObject>(to observableObject: T) -> AnyCancellable where T.ObjectWillChangePublisher == ObservableObjectPublisher {
        return objectWillChange
            .receive(on: DispatchQueue.main)
            .sink { [weak observableObject] (_) in
                observableObject?.objectWillChange.send()
            }
    }
}
