//
//  ViewController.swift
//  Homework1. UIKit
//
//  Created by Максим Бобков on 04.01.2024.
//

import UIKit
import WebKit

class ViewController: UIViewController {
    
    // Используем lazy (при котором свойство инициализируется только в момент первого вызова), поскольку внутри мы обращаемся к self - к самому объекту - экземпляру ViewController, в котором находимся (т.е. до обращения к свойству уже должен быть создан объект).
    private lazy var webView: WKWebView = {
        
        // В параметрах указываем frame таким образом, чтобы webView был полностью в границах экрана
        // Это можно было бы написать отдельно так: webView.frame = self.view.bounds
        let webView = WKWebView(frame: view.bounds)
        
        // Говорим, в каком классе будем обрабатывать действия на странице - пишем self, значит в данном классе
        webView.navigationDelegate = self
        
        return webView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        title = "ViewController"
        setupUI()
        
        // Параметр scope высчитываем на странице https://dev.vk.com/ru/reference/access-rights, складывая значения:
        /* friends - 2
           groups - 262144
           photos - 4
        */
        guard let url = URL(string: "https://oauth.vk.com/authorize?client_id=51839217&redirect_uri=https://oauth.vk.com/blank.html&scope=262150&display=mobile&response_type=token") else {
            return
        }
        
        // Загружаем страницу
        webView.load(URLRequest(url: url))
    }

    private func setupUI() {
        view.addSubview(webView)
    }
    
    // Тап на кнопке - переход к трём контроллерам с навигацией между собой через UITabBarController.
    private func tap() {
        
        // UITableViewController
        let tabl = UINavigationController(rootViewController: FriendsViewController())
        // Оборачиваем в UINavigationController, чтобы у каждого контроллера отображался свой собственный заголовок
        // UITableViewController
        let tab2 = UINavigationController(rootViewController: GroupsViewController())
        // UICollectionViewController
        let tab3 = UINavigationController(rootViewController: PhotosViewController(collectionViewLayout: UICollectionViewFlowLayout()))
        
        tabl.tabBarItem.title = "Friends"
        tab2.tabBarItem.title = "Groups"
        tab3.tabBarItem.title = "Photos"
        
        let tabs = [tabl, tab2, tab3]
        
        let tabBarController = UITabBarController()
        tabBarController.viewControllers = tabs
        
        // Вариант 1
        // Переход на другой контроллер через push.
        //navigationController?.pushViewController(tabBarController, animated: true)
        // Но при таком переходе наверху появляется ссылка на предыдущий контроллер.
        // Чтобы скрыть ссылку на возврат, указываем:
        //navigationController?.navigationBar.isHidden = true
        
        // Вариант 2
        // Получаем первую сцену, из неё - первое окно.
        guard let firstScene = UIApplication.shared.connectedScenes.first as? UIWindowScene,
              let firstWindow = firstScene.windows.first else {
            return
        }
        // Говорим окну, что у него корневой контроллер не тот, который мы задали в SceneDelegate, а наш tabBarController.
        firstWindow.rootViewController = tabBarController
    }
}



// Для обработки ответа от нашего webView, который произойдёт при загрузке страницы, создаём расширение (можно было бы ф-ю ниже разместить и в основном классе, добавив через запятую тип класса WKNavigationDelegate)
extension ViewController: WKNavigationDelegate {
    
    func webView(_ webView: WKWebView, decidePolicyFor navigationResponse: WKNavigationResponse, decisionHandler: @escaping (WKNavigationResponsePolicy) -> Void) {
        
        // Получаем url ответа, в котором содержится ряд данных, которые нам нужны. Разбиваем их на фрагменты.
        guard let url = navigationResponse.response.url, url.path == "/blank.html", let fragment = url.fragment else {
            decisionHandler(.allow)
            return
        }
        
        // Собираем фрагменты при помощи map и reduce в словарь [String: String]. Таким образом превратим JSON в словарь.
        let params = fragment
            .components(separatedBy: "§")
            .map { $0.components(separatedBy: "=") }
            .reduce([String: String]()) { result, param in
                var dict = result
                let key = param[0]
                let value = param[1]
                dict[key] = value
                //print("key: " + key + ", value: " + value)
                return dict
            }
        
        // Нам достаточно access_token, он будет нужен для дальнейших запросов друзей, групп и фотографий.
        // Будем хранить его в NetworkService в виде статичных свойств.
        // user_id не нужен.
        NetworkService.token = params["access_token"] ?? ""
        //NetworkService.userID = params["user_id"]
        
        print(NetworkService.token)
        //print(NetworkService.userID)

        decisionHandler(.cancel)
        
        // Удаляем ВК с экрана.
        webView.removeFromSuperview()
        
        // Переходим на наши три экрана с табБаром внизу.
        tap()
    }
}
