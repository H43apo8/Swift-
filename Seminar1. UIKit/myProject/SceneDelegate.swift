//
//  SceneDelegate.swift
//  myProject
//
//  Created by Максим Бобков on 25.12.2023.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        
        guard let scene = (scene as? UIWindowScene) else { return }
        
        // Чтобы первым отображался наш экран ViewController, пропишем:
        // Но поскольку мы далее решили создать меню выбора представлений, то комментируем эту строку и строки ниже, начинающиеся с window...
        //let navigationController = UINavigationController(rootViewController: ViewController())
        
        //window = UIWindow(windowScene: scene)
        //window?.rootViewController = navigationController
        //window?.makeKeyAndVisible()
        
        
        // Добавляем меню выбора экранов
        
        // Создаем UITabBarController
        let tabBarController = UITabBarController()
        
        // Создаем контроллеры, между которыми будем переключаться
        let viewController = ViewController()
        let nextViewController = NextViewController()
        
        // Задаем заголовки для контроллеров, которые будут отображаться в нижнем меню. Помимо текста можно задать и картинки.
        viewController.tabBarItem.title = "VC"
        nextViewController.tabBarItem.title = "NextVC"
        
        // В методе viewDidLoad обоих контроллеров нужно задать заголовок для экрана и заголовок для меню, соответствующий указанным выше заголовкам.
        //title = "View Controller"
        //tabBarItem.title = "VC"
        
        // Создаем массив с контроллерами, между которыми будем переключаться
        let controllers = [viewController, nextViewController]
 
        // Задаем tabBarController контроллеры, между которыми будем переключаться
        tabBarController.viewControllers = controllers

        let navigationController = UINavigationController(rootViewController: tabBarController)
        
        // Создаем UIWindow, в качестве windowScene передаем scene
        window = UIWindow(windowScene: scene)
        
        // Добавляем меню на основе UITabBarController - переключение между основными разделами приложения
        //window?.rootViewController = tabBarController
                
        // Добавляем меню на основе UINavigationController - пользователь может переходить от одного экрана к другому, а затем возвращаться назад по стеку представлений
        window?.rootViewController = navigationController
        
        // Назначаем window ключевым окном и сделать его видимым
        window?.makeKeyAndVisible()
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
        // Called as the scene transitions from the foreground to the background.
        // Use this method to save data, release shared resources, and store enough scene-specific state information
        // to restore the scene back to its current state.
    }


}

