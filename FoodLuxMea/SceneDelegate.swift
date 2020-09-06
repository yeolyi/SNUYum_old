//
//  SceneDelegate.swift
//  FoodLuxMea
//
//  Created by Seong Yeol Yi on 2020/08/24.
//


import UIKit
import SwiftUI
import Network

var isInternetConnected = false

class SceneDelegate: UIResponder, UIWindowSceneDelegate {


    var window: UIWindow?
    let listManager = ListManager()
    let dataManager = DataManager()
    let contentView = ContentView()
    let settingManager = SettingManager()
    let monitor = NWPathMonitor()
    
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        // Use this method to optionally configure and attach the UIWindow `window` to the provided UIWindowScene `scene`.
        // If using a storyboard, the `window` property will automatically be initialized and attached to the scene.
        // This delegate does not imply the connecting scene or session are new (see `application:configurationForConnectingSceneSession` instead).

        // Create the SwiftUI view that provides the window contents.

        
        monitor.pathUpdateHandler = { path in
            if path.status == .satisfied {
                isInternetConnected = true
                print("인터넷 연결됨")
            } else {
                isInternetConnected = false
                print("인터넷 연결되지 않음")
            }
        }
    
        let queue = DispatchQueue(label: "Monitor")
        monitor.start(queue: queue)
        
        if let userDefault = UserDefaults(suiteName: "group.com.wannasleep.FoodLuxMea"){
           userDefault.set(true as Bool, forKey: "firstRun")
        }
        
        settingManager.update(date: settingManager.date)
        self.listManager.update(newCafeList: self.dataManager.getData(at: self.settingManager.date))
        
        //requestPermission()
        
        // Use a UIHostingController as window root view controller.
        if let windowScene = scene as? UIWindowScene {
            let window = UIWindow(windowScene: windowScene)
            window.rootViewController = UIHostingController(rootView: contentView
                                                                .environmentObject(listManager)
                                                                .environmentObject(dataManager)
                                                                .environmentObject(settingManager))
            self.window = window
            window.makeKeyAndVisible()
        }
    }

    func sceneDidDisconnect(_ scene: UIScene) {
        // Called as the scene is being released by the system.
        // This occurs shortly after the scene enters the background, or when its session is discarded.
        // Release any resources associated with this scene that can be re-created the next time the scene connects.
        // The scene may re-connect later, as its session was not necessarily discarded (see `application:didDiscardSceneSessions` instead).
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
        settingManager.update(date: settingManager.date)
        listManager.update(newCafeList: self.dataManager.getData(at: self.settingManager.date))
    }

    func sceneDidEnterBackground(_ scene: UIScene) {
        // Called as the scene transitions from the foreground to the background.
        // Use this method to save data, release shared resources, and store enough scene-specific state information
        // to restore the scene back to its current state.
        dataManager.save()
        listManager.save()
    }


}
