//
//  GroupsViewController.swift
//  Homework1. UIKit
//
//  Created by Максим Бобков on 19.01.2024.
//

import UIKit

final class GroupsViewController: UITableViewController {

    // Создаём объект NetworkService
    private let networkService = NetworkService()
    
    private var model: [Group] = []
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        view.backgroundColor = .white
        title = "Groups"
        
        // Для возможности переиспользовать ячейки
        tableView.register(GroupCell.self, forCellReuseIdentifier: "cell")
        
        // Запрашиваем список групп. Без параметров. Просто чтобы вывести данные в консоль.
        //NetworkService.getGroups()
        
        // Передаём в ф-ю getGroups замыкание, которое в самой ф-и обозначим как @escaping, чтобы после выполнения ф-и сюда вернулся массив, который мы сможем положить в model.
        networkService.getGroups { [weak self] groups in
            
            self?.model = groups
            
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
        //GroupCell()
        
        // Проверяем, а точно ли ячейка, полученная через dequeueReusableCell, имеет нужный нам тип - GroupCell.
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? GroupCell else {
            return UITableViewCell()
        }
        
        cell.updateCell(group: model[indexPath.row])
        
        return cell
    }
}
