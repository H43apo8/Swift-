//
//  FriendCell.swift
//  Homework1. UIKit
//
//  Created by Максим Бобков on 19.01.2024.
//

import UIKit

final class FriendCell: UITableViewCell {
    
    // Создаём кружок слева и лейбл справа
    
    // Кружок - это квадрат со скруглёнными углами
    private var friendAvatar: UIImageView = {
        let view = UIImageView()
        view.backgroundColor = .gray
        view.layer.cornerRadius = 20 // Половина длины стороны
        return view
    }()
    
    private var friendName: UILabel = {
        let label = UILabel()
        label.text = "Name"
        label.textAlignment = .left
        label.textColor = .black
        label.backgroundColor = .white
        return label
    }()
    
    private var friendIsOnline: UIView = {
        let view = UIView()
        view.backgroundColor = .red
        view.layer.cornerRadius = 5 // Половина длины стороны
        return view
    }()
    
    // Функции viewDidLoad у ячейки нет, поэтому пользуемся инициализатором
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        backgroundColor = .clear // Чтобы ячейка была прозрачной (цвета фона)
        setupUI()
        addConstraints()
    }
    
    // Обязательный инициализатор
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // После получения данных с сервера ВК обновляем текст в лейбле и картинку
    func updateCell(friend: Friend) {
        
        friendName.text = friend.firstName + " " + friend.lastName
        
        friendIsOnline.backgroundColor = friend.online == 1 ? .green : .red
        
        // Поскольку мы будем получать данные по урл (через try? Data), мы должны предварительно вручную встать на другой поток (в глобальную очередь), а потом также вручную вернуться обратно на главный поток (в основную очередь)
        DispatchQueue.global().async {
            
            // Проверяем урл картинки и следом получаем саму картинку по этому урл через try? Data
            if let url = URL(string: friend.photo), let image = try? Data(contentsOf: url) {
                
                DispatchQueue.main.async {
                    self.friendAvatar.image = UIImage(data: image)
                }
            }
        }
    }
    
    private func setupUI() {
        
        // В случае с ячейками элементы добавляем не на view, а на contentView, чтобы в дальнейшем наша ячейка могла подстраиваться под размеры отведённой для неё области
        contentView.addSubview(friendAvatar)
        contentView.addSubview(friendName)
        contentView.addSubview(friendIsOnline)
    }
    
    private func addConstraints() {
        
        friendAvatar.translatesAutoresizingMaskIntoConstraints = false
        friendName.translatesAutoresizingMaskIntoConstraints = false
        friendIsOnline.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            
            friendAvatar.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            friendAvatar.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 10),
            friendAvatar.heightAnchor.constraint(equalToConstant: 40),
            friendAvatar.widthAnchor.constraint(equalTo: friendAvatar.heightAnchor),
            
            friendName.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            friendName.leftAnchor.constraint(equalTo: friendAvatar.rightAnchor, constant: 30),
            friendName.rightAnchor.constraint(equalTo: friendIsOnline.leftAnchor, constant: -10),
            
            friendIsOnline.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            friendIsOnline.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -10),
            friendIsOnline.heightAnchor.constraint(equalToConstant: 10),
            friendIsOnline.widthAnchor.constraint(equalTo: friendIsOnline.heightAnchor),
        ])
    }
}
