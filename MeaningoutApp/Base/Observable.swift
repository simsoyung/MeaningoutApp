//
//  Observable.swift
//  MeaningoutApp
//
//  Created by 심소영 on 7/9/24.
//

import Foundation

class Observable<T> {
    var closure: ((T) -> Void)?
    
    var value: T {
        didSet{
            closure?(value)
        }
    }
    init(_ value: T) {
        self.value = value
    }
    func bind(closure: @escaping (T) -> Void){
        closure(value)
        self.closure = closure
    }
}
