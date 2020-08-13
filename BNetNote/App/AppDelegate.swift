//
//  AppDelegate.swift
//  BNetNote
//
//  Created by Alexander on 13.08.2020.
//

import DITranquillity
import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        let container = DIContainer()
        container.append(framework: AppFramework.self)
        container.initializeSingletonObjects()
        
        // Generate a new session token when the app has been launched
        let noteAPI: NotesAPI = *container
        noteAPI.startNewSession(parameters: nil) { result in
            switch result {
            case .success(let sessionCreationResponse):
                if !UserDefaults.standard.bool(forKey: UserDefaultsKeys.firstAppLaunch) {
                    UserDefaults.standard.set(true, forKey: UserDefaultsKeys.firstAppLaunch)
                    UserDefaults.standard.set(sessionCreationResponse.sessionCreationData.sessionToken,
                    forKey: UserDefaultsKeys.sessionToken)
                }
            case .failure:
                print("Unable to get user-session token")
            }
        }
        
        let noteListViewController: NoteListViewController = *container
        
        window = UIWindow(frame: UIScreen.main.bounds)
        window!.rootViewController = noteListViewController
        window?.makeKeyAndVisible()
        
        return true
    }
}

