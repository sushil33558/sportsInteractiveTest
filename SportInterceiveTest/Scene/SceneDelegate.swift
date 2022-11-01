//
//  SceneDelegate.swift
//  SportInterceiveTest
//  Created by Sushil Chaudhary on 10/27/22.
//-----------------------------------------------------------------------
import UIKit
class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    
    //MARK: - variables
    //---------------
    var window: UIWindow?
    
    //MARK: - func
    //---------------
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let _ = (scene as? UIWindowScene) else { return }
    }
    //MARK: - App States
    func sceneDidDisconnect(_ scene: UIScene) {
    }

    func sceneDidBecomeActive(_ scene: UIScene) {
    }

    func sceneWillResignActive(_ scene: UIScene) {
    }

    func sceneWillEnterForeground(_ scene: UIScene) {
    }

    func sceneDidEnterBackground(_ scene: UIScene) {
    }
}

