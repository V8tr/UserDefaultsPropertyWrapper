//
//  main.swift
//  UserDefaultsPropertyWrapper
//
//  Created by Vadim Bulavin on 4/17/20.
//  Copyright © 2020 Vadim Bulavin. All rights reserved.
//

import Foundation

extension Key {
    static let isFirstLaunch: Key = "isFirstLaunch"
}

struct Storage {
    @UserDefault(key: .isFirstLaunch)
    var isFirstLaunch: Bool?
}

var storage = Storage()

var observation = storage.$isFirstLaunch.observe { old, new in
    print("Changed from: \(old as Optional) to \(new as Optional)")
}

storage.isFirstLaunch?.toggle()
