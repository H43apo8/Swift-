//
//  NewViewController.swift
//  CreateAppCodeForGB
//
//  Created by Анастасия Рябова on 07.08.2023.
//

import UIKit

class NewViewController: UITableViewController {
    
//    private var tableView = UITableView(frame: .zero, style: .grouped)
    
    private var networkService = NetworkService()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //view.backgroundColor = .blue
        view.backgroundColor = .white
        
        title = "NewViewController"
        navigationController?.navigationBar.prefersLargeTitles = true
        tabBarItem.title = "new VC"
        
//        view.addSubview(tableView)
//        setupConstraints()
//
//        tableView.dataSource = self
//        tableView.delegate = self
        
        tableView.register(CustomTableViewCell.self, forCellReuseIdentifier: "cell")
        
        networkService.delegate = self
        networkService.getData { [weak self] towns in
            self?.models = towns
            DispatchQueue.main.async {
                self?.tableView.reloadData()
            }
        }
    }
    
    // Количество строк в секции
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        30
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell")
        
        guard let cell = cell as? CustomTableViewCell else  {
            return UITableViewCell()
        }
        
        if indexPath.row == 0 {
            cell.accessoryType = .checkmark
        }
        
        return cell
    }
    
    // Количество секций
    override func numberOfSections(in tableView: UITableView) -> Int {
        4
    }
    
    // Название секций
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        "Section"
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        navigationController?.pushViewController(ViewController(), animated: true)
//        navigationController?.pushViewController(CollectionViewController(), animated: true)
//        navigationController?.pushViewController(CollectionViewController(collectionViewLayout: UICollectionViewFlowLayout()), animated: true)
        navigationController?.pushViewController(CollectionViewController(collectionViewLayout: getLayout()), animated: true)
    }
    
    // Высота заголовка секции
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        100
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        UITableView.automaticDimension
    }
    
    private func getLayout() -> UICollectionViewLayout {

        let itemSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(0.3),
            heightDimension: .fractionalHeight(1.0))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)

        let groupSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1.0),
            heightDimension: .absolute(view.frame.size.width/3))
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])

        let section = NSCollectionLayoutSection(group: group)

        let layout = UICollectionViewCompositionalLayout(section: section)
        return layout
    }
    
//    private func setupConstraints() {
//        tableView.translatesAutoresizingMaskIntoConstraints = false
//
//        NSLayoutConstraint.activate([
//            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
//            tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
//            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
//            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
//        ])
//    }
}

extension NewViewController: NetworkServiceDelegate {
    
    // В этой переменной будут храниться модели для отображения
    private var models: [Town] = []
    
    func updateData(towns: [Town]) {
        models = towns
        tableView.reloadData()
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        models.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell")
        
        guard let cell = cell as? CustomTableViewCell else  {
            return UITableViewCell()
        }
        
        cell.setupTitles(townName: models[indexPath.row].townName, lat: models[indexPath.row].coords.lat, lon: models[indexPath.row].coords.lon)
        
        return cell
    }
}

//
//
//extension NewViewController: UITableViewDataSource {
//    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        30
//    }
//
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
////         print(indexPath.section)
////         print(indexPath.row)
////        let cell = UITableViewCell(style: .default, reuseIdentifier: nil)
////
////        cell.textLabel?.text = "Hello"
////        cell.imageView?.image = UIImage(systemName: "person")
//
//        let cell = tableView.dequeueReusableCell(withIdentifier: "cell")
//        guard let cell = cell as? CustomTableViewCell else  {
//            return UITableViewCell()
//        }
//        if indexPath.row == 0 {
//            cell.accessoryType = .checkmark
//        }
//        return cell
//    }
//
//    func numberOfSections(in tableView: UITableView) -> Int {
//        4
//    }
//
//    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
//        "Section"
//    }
//}
//
//extension NewViewController: UITableViewDelegate {
//    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        navigationController?.pushViewController(ViewController(), animated: true)
//    }
//
//    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
//        100
//    }
//
//    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
//        UITableView.automaticDimension
//    }
//}


