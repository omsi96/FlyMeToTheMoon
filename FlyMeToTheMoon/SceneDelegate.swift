//
//  SceneDelegate.swift
//  FlyMeToTheMoon
//
//  Created by Omar Alibrahim on 1/29/20.
//  Copyright © 2020 Omsi. All rights reserved.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    
    var window: UIWindow?
    
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        window = UIWindow(windowScene: windowScene)
        redirectIfNotSignedIn()
        // let windowScene = UIWindowScene(session: session, connectionOptions: connectionOptions)
//        self.window = UIWindow(windowScene: windowScene)
        
//        redirectIfNotSignedIn()
        
    }
    
    func sceneDidDisconnect(_ scene: UIScene) {
        // Called as the scene is being released by the system.
        // This occurs shortly after the scene enters the background, or when its session is discarded.
        // Release any resources associated with this scene that can be re-created the next time the scene connects.
        // The scene may re-connect later, as its session was not neccessarily discarded (see `application:didDiscardSceneSessions` instead).
    }

    func sceneDidBecomeActive(_ scene: UIScene) {
        // Called when the scene has moved from an inactive state to an active state.
        // Use this method to restart any tasks that were paused (or not yet started) when the scene was inactive.
    }

    func sceneWillResignActive(_ scene: UIScene) {
        // Called when the scene will move from an active state to an inactive state.
        // This may occur due to temporary interruptions (ex. an incoming phone call).
    }

    func sceneWillEnterForeground(_ scene: UIScene) {
        // Called as the scene transitions from the background to the foreground.
        // Use this method to undo the changes made on entering the background.
    }

    func sceneDidEnterBackground(_ scene: UIScene) {
        // Called as the scene transitions from the foreground to the background.
        // Use this method to save data, release shared resources, and store enough scene-specific state information
        // to restore the scene back to its current state.
    }


}



extension SceneDelegate{
    func redirect(storyBoardName: String, viewControllerIdName: String? = nil)
    {
        let viewControllerIdName = viewControllerIdName ?? storyBoardName
        
        let storyboard = UIStoryboard(name: storyBoardName, bundle: nil)
        let rootVC = storyboard.instantiateViewController(identifier: viewControllerIdName)
        
        self.window?.rootViewController = rootVC
        self.window?.makeKeyAndVisible()
    }
    
    
    func redirectIfNotSignedIn()
    {
        if let _ = UserDefaults.standard.value(forKey: "signed") as? Bool{
            redirect(storyBoardName: "Main")
        }
        else {
            redirect(storyBoardName: "Auth")
        }
        
    }
}
