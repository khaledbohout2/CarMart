//
//  SettingsSinglton.swift
//  GPless
//
//  Created by Khaled Bohout on 12/6/20.
//

import Foundation

/// settings singlton to share it through the application

final class SharedSettings {
    
    static var shared = SharedSettings()
    var settings: Settings?
    
    private init() { }
}
