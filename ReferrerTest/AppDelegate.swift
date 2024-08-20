//
//  AppDelegate.swift
//  ReferrerTest
//
//  Created by Leonardo da Silva on 19/08/24.
//

import UIKit
import SwiftUI

@main
class AppDelegate: NSObject, UIApplicationDelegate {
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        
        return true
    }
    
    func application(_ application: UIApplication, continue userActivity: NSUserActivity, restorationHandler: @escaping ([any UIUserActivityRestoring]?) -> Void) -> Bool {
        print("continue=\(userActivity.activityType)")
        return true
    }
    
    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        print("creating configuration")
        let configuration = UISceneConfiguration(
            name: nil,
            sessionRole: connectingSceneSession.role
        )
        configuration.delegateClass = SceneDelegate.self
        return configuration
    }
}

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    var window: UIWindow?
    
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        let controller = UIHostingController(rootView: ContentView())
        let window = UIWindow(windowScene: windowScene)
        self.window = window
        window.rootViewController = controller
        window.makeKeyAndVisible()
    }
    
    func scene(_ scene: UIScene, openURLContexts URLContexts: Set<UIOpenURLContext>) {
        for context in URLContexts {
            print("url: \(context.url.absoluteURL)")
            print("scheme: \(context.url.scheme)")
            print("host: \(context.url.host)")
            print("path: \(context.url.path)")
            print("components: \(context.url.pathComponents)")
        }
    }

    func scene(_ scene: UIScene, continue userActivity: NSUserActivity) {
        print("(scene) continue=\(userActivity.activityType), referrerUrl=\(userActivity.referrerURL)")
    }
}
