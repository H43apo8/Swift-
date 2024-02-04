//
//  ProfileViewController.swift
//  Homework4
//
//  Created by Максим Бобков on 26.01.2024.
//

import UIKit

class ProfileViewController: UIViewController {
    
    // Создаём объект NetworkService
    private let networkService = NetworkService()
    
    // Кружок с фото профиля - это квадрат со скруглёнными углами
    private var profileImage: UIImageView = {
        let view = UIImageView()
        view.backgroundColor = .gray
        view.layer.cornerRadius = 50 // Половина длины стороны
        view.clipsToBounds = true // Включаем обрезание по границам
        return view
    }()
    
    private var profileName: UILabel = {
        let label = UILabel()
        label.text = "Name"
        label.textAlignment = .center
        label.textColor = .black
        label.backgroundColor = .white
        return label
    }()
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        view.backgroundColor = .white
        
        setupUI()
        addConstraints()
        
        // Передаём в ф-ю getProfileInfo замыкание, которое в самой ф-и обозначим как @escaping, чтобы после выполнения ф-и сюда вернулся массив, который мы сможем положить в model.
        networkService.getProfileInfo { [weak self] profile in
            
            print(profile)
            
            // Поскольку при запросе к другому серверу система переключается на другую очередь, то вручную переводим на основную очередь.
            DispatchQueue.main.async {
                
                // Обновляем страницу профиля
                self?.updateProfile(profile: profile)
            }
        }
    }
    
    private func setupUI() {
        
        view.addSubview(profileImage)
        view.addSubview(profileName)
    }
    
    private func addConstraints() {
        
        profileImage.translatesAutoresizingMaskIntoConstraints = false
        profileName.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            
            profileImage.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            profileImage.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            profileImage.widthAnchor.constraint(equalToConstant: 100),
            profileImage.heightAnchor.constraint(equalTo: profileImage.widthAnchor),
            
            profileName.topAnchor.constraint(equalTo: profileImage.bottomAnchor, constant: 20),
            profileName.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            profileName.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 20),
            profileName.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -20),
        ])
    }
    
    // После получения данных с сервера ВК обновляем картинку и текст профиля
    func updateProfile(profile: Profile) {
        
        profileName.text = profile.firstName + " " + profile.lastName
        
        // Поскольку мы будем получать данные по урл (через try? Data), мы должны предварительно вручную встать на другой поток (в глобальную очередь), а потом также вручную вернуться обратно на главный поток (в основную очередь)
        DispatchQueue.global().async {
            
            // Проверяем урл картинки и следом получаем саму картинку по этому урл через try? Data
            if let url = URL(string: profile.photo ?? ""), let image = try? Data(contentsOf: url) {
                
                DispatchQueue.main.async {
                    self.profileImage.image = UIImage(data: image)
                }
            }
        }
    }
}
