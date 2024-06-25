//
//  SceneDelegate.swift
//  TochnoNeAviasales
//
//  Created by Владислав Баранов on 21.06.2024.
//

import UIKit
import SVGKitSwift

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    
    var window: UIWindow?
    
    
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        
        fetchData(from: "https://run.mocky.io/v3/ad9a46ba-276c-4a81-88a6-c068e51cce3a") { (result: Result<WelcomeStruct, Error>) in
            switch result {
            case .success(let data):
                if let currentOffers = data.offers {
                    welcomeArray = currentOffers
                    
                    let manager = CoreDataManager()
                    
                    if let loadedData = manager.getReadData() {
                        currentForm = loadedData
                    }
                    
                    DispatchQueue.main.async{
                        let mainView = MainTabBarController()
                        self.window?.rootViewController = mainView
                        self.window?.makeKeyAndVisible()
                    }
                }
            case .failure(let error):
                //Нормальная обработка ошибки
                print("Ошибка: \(error)")
            }
        }
        
        
//                let mainView =  ShowAllTicketsViewController()
//                fetchData(from: "https://run.mocky.io/v3/c0464573-5a13-45c9-89f8-717436748b69") { (result: Result<ShowAll, Error>) in
//                    switch result {
//                    case .success(let data):
//                        if let currentOffers = data.tickets {
//                            print("suc")
//                            allTicketsArray = currentOffers
//                            availableTickets = allTicketsArray
//                            DispatchQueue.main.async{
//                                self.window?.rootViewController = mainView
//                                self.window?.makeKeyAndVisible()
//                            }
//                        } else {
//                            print("data.ticketsOffers == nil")
//                        }
//                    case .failure(let error):
//                        print("Ошибка: \(error)")
//                    }
//        
//                }
//        
        
//        fetchData(from: "https://run.mocky.io/v3/38b5205d-1a3d-4c2f-9d77-2f9d1ef01a4a") { (result: Result<CountryPicked, Error>) in
//
//            switch result {
//            case .success(let data):
//                if let currentOffers = data.ticketsOffers {
//                    print("suc")
//                    ticketsOfferArray = currentOffers
//                    DispatchQueue.main.async{
//                        self.window?.rootViewController = mainView
//                        self.window?.makeKeyAndVisible()
//                    }
//                } else {
//                    print("data.ticketsOffers == nil")
//                }
//            case .failure(let error):
//                print("Ошибка: \(error)")  
//            }
//
//        }
        
    


        // Use this method to optionally configure and attach the UIWindow `window` to the provided UIWindowScene `scene`.
        // If using a storyboard, the `window` property will automatically be initialized and attached to the scene.
        // This delegate does not imply the connecting scene or session are new (see `application:configurationForConnectingSceneSession` instead).
        guard let _ = (scene as? UIWindowScene) else { return }
        
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
    }

    func sceneDidEnterBackground(_ scene: UIScene) {
        
        let manager = CoreDataManager()
        
        if let _ = manager.getReadData(), let _ = currentForm {
            manager.updateData(currentForm!)
        } else if let _ = currentForm {
            manager.createData(city: currentForm!)
        }
        
        
        // Called as the scene transitions from the foreground to the background.
        // Use this method to save data, release shared resources, and store enough scene-specific state information
        // to restore the scene back to its current state.

        // Save changes in the application's managed object context when the application transitions to the background.
//        (UIApplication.shared.delegate as? AppDelegate)?.saveContext()
    }


}

