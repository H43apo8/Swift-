//
//  CustomCollectionNewCell.swift
//  myProject
//
//  Created by Максим Бобков on 11.01.2024.
//

import UIKit

final class CustomCollectionNewCell: UICollectionViewCell {
    
    // Каждая ячейка будет представлять из себя картинку
    private var cellImage = UIImageView(image: UIImage(systemName: "person"))
    
    // Для реализации GestureRecognizer при тапе на ячейке.
    // Мы должны получать картинку из ячейки и пробрасывать дальше.
    // Создаём кложуру, которая на вход принимает UIImage и ничего не возвращает.
    // Делаем опционалом, т.к. тап может быть, а может и не быть.
    var tapOnCell: ((UIImage) -> Void)?
    
    override init(frame: CGRect) { // CGRect - это тип, который позволяет выстроить X, Y, ширину и высоту
        
        super.init(frame: frame)
        
        setupUI()
        addConstraints()
        
        // Поскольку addTarget (действие по клику) есть только у кнопки, для других элементов можно применять GestureRecognizer по тапу, свайпу, сколу, зуму и т.д. Синтаксис похож на addTarget.
        let recognizer = UITapGestureRecognizer(target: self, action: #selector(clickOnCell))
        addGestureRecognizer(recognizer)
    }
    
    // Обязательный инициализатор
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupUI() {
        contentView.addSubview(cellImage)
        
        // cellImage имеет тип UIImageView, функционал которого мы расширили в файле UIImageView+Extensions, добавив функцию  getDogImage().
        cellImage.getDogImage()
    }
    
    private func addConstraints() {
        
        cellImage.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            
            // Растягиваем картинку на всю ширину и высоту ячейки
            cellImage.topAnchor.constraint(equalTo: contentView.topAnchor),
            cellImage.rightAnchor.constraint(equalTo: contentView.rightAnchor),
            cellImage.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            cellImage.leftAnchor.constraint(equalTo: contentView.leftAnchor)
        ])
    }
    
    // При клике/тапе на ячейке передаём картинку, которая находится в ней.
    @objc func clickOnCell() {
        tapOnCell?(cellImage.image ?? UIImage())
    }
}
