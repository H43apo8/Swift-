//
//  FriendsViewController.swift
//  Homework1. UIKit
//
//  Created by Максим Бобков on 19.01.2024.
//

import UIKit

final class FriendsViewController: UITableViewController {
    
    // Создаём объект NetworkService
    private let networkService = NetworkService()
            
    private var model: [Friend] = []

    override func viewDidLoad() {
        
        super.viewDidLoad()
        view.backgroundColor = .white
        title = "Friends"
        
        // Создаём кнопку в navigationBar наверху справа для перехода в профиль пользователя
        navigationController?.navigationBar.tintColor = .black
        navigationController?.navigationBar.barTintColor = .white
        navigationItem.rightBarButtonItem = UIBarButtonItem(
            image: UIImage(systemName: "person"),
            style: .plain,
            target: self,
            action: #selector(tap)
        )
        
        // Для возможности переиспользовать ячейки
        tableView.register(FriendCell.self, forCellReuseIdentifier: "cell")
        
        // Запрашиваем список друзей. Без параметров. Просто чтобы вывести данные в консоль.
        //NetworkService.getFriends()
        
        // Передаём в ф-ю getFriends замыкание, которое в самой ф-и обозначим как @escaping, чтобы после выполнения ф-и сюда вернулся массив, который мы сможем положить в model.
        networkService.getFriends { [weak self] friends in
            
            self?.model = friends
            
            // Поскольку при запросе к другому серверу система переключается на другую очередь, то вручную переводим на основную очередь.
            DispatchQueue.main.async {
                
                // Перезагружаем таблицу
                self?.tableView.reloadData()
            }
        }
    }
    
    // Определяем количество ячеек в каждом разделе
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //5
        model.count
    }
    
    // Саму ячеку определяем в отдельном классе FriendsCell в отдельном файле
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        // Если без переиспользования ячеек:
        //FriendCell()
        
        // Проверяем, а точно ли ячейка, полученная через dequeueReusableCell, имеет нужный нам тип - FriendCell.
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? FriendCell else {
            return UITableViewCell()
        }
        
        cell.updateCell(friend: model[indexPath.row])
        
        return cell
    }
}


// MARK: objc methods

// Создаём расширение для выноса всех objc-методов, чтобы лучше ориентироваться по коду
private extension FriendsViewController {
    
    // Поведение кнопки в navigationBar наверху справа для перехода в профиль пользователя
    @objc func tap() {
        // Задаём анимацию перехода к контроллеру с профилем
        let animation = CATransition()
        animation.timingFunction = CAMediaTimingFunction(name: .easeOut)
        animation.type = .moveIn
        animation.duration = 1
        // Применяем анимацию к текущему контроллеру
        navigationController?.view.layer.add(animation, forKey: nil)
        // Переходим к новому контроллеру
        navigationController?.pushViewController(ProfileViewController(), animated: false)
    }
}
