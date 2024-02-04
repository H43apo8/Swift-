//
//  TableViewController.swift
//  myProject
//
//  Created by Максим Бобков on 11.01.2024.
//

import UIKit

final class TableViewController: UITableViewController {
    
    private let networkService = NetworkService()
    
    private var model: [Town] = []
    
    private var userDefaultsService = UserDefaultsService()
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        view.backgroundColor = Theme.currentTheme.backgroundColor
        tableView.backgroundColor = Theme.currentTheme.backgroundColor
        //view.backgroundColor = UIColor(red: 0.4470588235, green: 0.9450980392, blue: 0.7137254902, alpha: 1)
        
        // Для возможности переиспользовать ячейки
        tableView.register(CustomTableNewCell.self, forCellReuseIdentifier: "cell")
        
        // Без параметров, чтобы просто вывести массив полученных городов, декодированных в JSON, в консоль через команду ниже print(towns) в классе NetworkService
        //networkService.task()
        
        model = userDefaultsService.get()
        tableView.reloadData()
        
        // Передаём замыкание в ф-ю task, которое в самой ф-и обозначим как @escaping, чтобы после выполнения ф-и сюда вернулся массив, который мы сможем положить в model.
        networkService.task { [weak self] towns in
            
            self?.model = towns
            self?.userDefaultsService.save(towns: towns)
            
            // Поскольку при запросе к другому серверу система переключается на другую очередь, то вручную переводим на основную очередь.
            DispatchQueue.main.async {
                
                // Перезагружаем таблицу
                self?.tableView.reloadData()
            }
        }
        
        //networkService.proccessError(errorCode: 404)
        //networkService.getNews()
        //networkService.getPlaces()
        //networkService.getMovies()
    }
    
    // Определяем количество разделов
    //override func numberOfSections(in tableView: UITableView) -> Int {
    //    3
    //}
    
    // Определяем количество ячеек в каждом разделе
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        model.count
    }
    
    // Саму ячеку определяем в отдельном классе CustomTableNewCell в отдельном файле
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        // Создание ячейки без переиспользования
        //CustomTableNewCell()
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? CustomTableNewCell else {
            return UITableViewCell()
        }
        
        cell.updateCell(town: model[indexPath.row])
        
        return cell
    }
    
    // Заголовки разделов
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        
        // Можно написать просто "Section", тогда все разделы будут иметь один и тот же заголовок "Section"
        //"Section"
        
        // Можно каждому разделу дать своё название
//        if section == 0 {
//            return "Section 1"
//        } else if section == 1 {
//            return "Section 2"
//        } else {
//            return "Section 3"
//        }
        return nil
    }
}


//#Preview {
//    TableViewController()
//}
