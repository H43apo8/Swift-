//
//  CustomTableNewCell.swift
//  myProject
//
//  Created by Максим Бобков on 11.01.2024.
//

import UIKit

final class CustomTableNewCell: UITableViewCell {
    
    // Создаём кружок слева и три лейбла друг под другом справа
    
    private var label1: UILabel = {
        let label = UILabel()
        label.text = "Текст1"
        label.textAlignment = .center
        label.textColor = .black
        label.backgroundColor = .white
        return label
    }()
    
    private var label2: UILabel = {
        let label = UILabel()
        label.text = "Текст2"
        label.textAlignment = .center
        label.textColor = .black
        label.backgroundColor = .white
        return label
    }()
    
    private var label3: UILabel = {
        let label = UILabel()
        label.text = "Текст3"
        label.textAlignment = .center
        label.textColor = .black
        label.backgroundColor = .white
        return label
    }()
    
    // Квадрат со скруглёнными углами
    private var circleView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.layer.cornerRadius = 25 // Половина длины стороны
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
    
    func updateCell(town: Town) {
        
        if let lat = town.coords.lat, let lon = town.coords.lon {
            if lat + lon < 100 {
                circleView.backgroundColor = #colorLiteral(red: 0, green: 0.8065392375, blue: 0.9516738057, alpha: 1)
            } else {
                circleView.backgroundColor = #colorLiteral(red: 0.648013413, green: 0.2732303739, blue: 0.9679442048, alpha: 1)
            }
        } else {
            circleView.backgroundColor = .gray
        }
        
        label1.text = town.name
        label2.text = town.timezone
        label3.text = town.currency
    }
    
    private func setupUI() {
        
        // В случае с ячейками элементы добавляем не на view, а на contentView, чтобы в дальнейшем наша ячейка могла подстраиваться под размеры
        contentView.addSubview(label1)
        contentView.addSubview(label2)
        contentView.addSubview(label3)
        contentView.addSubview(circleView)
    }
    
    private func addConstraints() {
        
        label1.translatesAutoresizingMaskIntoConstraints = false
        label2.translatesAutoresizingMaskIntoConstraints = false
        label3.translatesAutoresizingMaskIntoConstraints = false
        circleView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            
            circleView.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            circleView.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 10),
            circleView.heightAnchor.constraint(equalToConstant: 50),
            circleView.widthAnchor.constraint(equalTo: circleView.heightAnchor),
            
            // Чтобы ячейка изменяла свои размеры в зависимости от размера контента, нужно привязать один элемент к верху ячейки и один элемент к низу ячейки
            
            // Прижимаем в верхнему краю
            label1.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
            label1.leftAnchor.constraint(equalTo: circleView.rightAnchor, constant: 30),
            label1.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -10),
            
            label2.topAnchor.constraint(equalTo: label1.bottomAnchor, constant: 10),
            label2.leftAnchor.constraint(equalTo: label1.leftAnchor),
            label2.rightAnchor.constraint(equalTo: label1.rightAnchor),
            
            // Прижимаем к нижнему краю
            label3.topAnchor.constraint(equalTo: label2.bottomAnchor, constant: 10),
            label3.leftAnchor.constraint(equalTo: label1.leftAnchor),
            label3.rightAnchor.constraint(equalTo: label1.rightAnchor),
            label3.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10)
        ])
    }
}
