//
//  FriendsViewController.swift
//  Homework1. UIKit
//
//  Created by Максим Бобков on 19.01.2024.
//

import UIKit

final class FriendsViewController: UITableViewController {
    
    // Создаём объект NetworkService
    //private let networkService = NetworkService()
    // Чтобы не создавать каждый раз объект, сделал его методы статичными, т.к. нам в данном случае не нужны разные экземпляры NetworkService.
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        view.backgroundColor = .white
        title = "Friends"
        
        // Для возможности переиспользовать ячейки
        tableView.register(FriendCell.self, forCellReuseIdentifier: "cell")
        
        // Запрашиваем список друзей
        NetworkService.getFriends()
    }
    
    // Определяем количество ячеек в каждом разделе
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        5
    }
    
    // Саму ячеку определяем в отдельном классе FriendsCell в отдельном файле
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // Если без переиспользования ячеек:
        //FriendCell()
        
        // Проверяем, а точно ли ячейка, полученная через dequeueReusableCell, имеет нужный нам тип - FriendCell.
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as? FriendCell else {
            return UITableViewCell()
        }
        
        return cell
    }
}
