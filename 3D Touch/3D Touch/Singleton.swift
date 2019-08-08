//
//  Singleton.swift
//  3dtouch hello world
//
//  Created by MacInBox on 07/08/19.
//  Copyright © 2019 MacInBox. All rights reserved.
//

import Foundation
import UIKit

class Singleton {
    static let shared = Singleton()
    
    var forceTouch: UIApplicationShortcutItem? = nil
    
    var type: ForceTouch? = nil
    
    private init() {}
}
