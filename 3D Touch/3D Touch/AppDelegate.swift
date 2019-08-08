//
//  AppDelegate.swift
//  3dtouch hello world
//
//  Created by MacInBox on 07/08/19.
//  Copyright © 2019 MacInBox. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    var shortcut: UIApplicationShortcutItem?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        if let shortcutItem = launchOptions?[UIApplication.LaunchOptionsKey.shortcutItem] as? UIApplicationShortcutItem {
            shortcut = shortcutItem
        }
        
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.rootViewController = UINavigationController(rootViewController: ViewController())
        window?.makeKeyAndVisible()
        
        return true
    }

    func application(_ application: UIApplication, performActionFor shortcutItem: UIApplicationShortcutItem, completionHandler: @escaping (Bool) -> Void) {
        shortcut = shortcutItem
        guard let item = shortcut else {completionHandler(false);return}
        Singleton.shared.forceTouch = item
        
        completionHandler(true)
    }
    
    func applicationDidBecomeActive(_ application: UIApplication) {
        if let item = Singleton.shared.forceTouch {
            if let action: ForceTouch? = {
                switch item.localizedTitle {
                case "Cartão virtual":
                    return .cartaoVirtual
                case "Minha fatura":
                    return .fatura
                case "Atendimento":
                    return .atendimento
                case "Benefícios":
                    return .beneficios
                default:
                    return nil
                }
            }() {
                Singleton.shared.type = action
            }
        }
        NotificationCenter.default.post(name: NSNotification.Name("post"), object: nil)
    }

}

