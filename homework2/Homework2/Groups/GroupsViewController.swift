//
//  GroupsViewController.swift
//  Homework1. UIKit
//
//  Created by Максим Бобков on 19.01.2024.
//

import UIKit

final class GroupsViewController: UITableViewController {
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        view.backgroundColor = .white
        title = "Groups"
        
        // Для возможности переиспользовать ячейки
        tableView.register(GroupCell.self, forCellReuseIdentifier: "cell")
    }
    
    // Определяем количество ячеек в каждом разделе
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        5
    }
    
    // Саму ячеку определяем в отдельном классе FriendsCell в отдельном файле
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // Если без переиспользования ячеек:
        //GroupCell()
        
        // Проверяем, а точно ли ячейка, полученная через dequeueReusableCell, имеет нужный нам тип - GroupCell.
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as? GroupCell else {
            return UITableViewCell()
        }
        
        return cell
    }
}
