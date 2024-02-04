//
//  CustomButton.swift
//  myProject
//
//  Created by Максим Бобков on 11.01.2024.
//

import UIKit

final class CustomButton: UIButton {
    
    init(text: String) {
        super.init(frame: .zero)
        setTitle(text, for: .normal)
        setTitleColor(.white, for: .normal)
        setTitleColor(.red, for: .highlighted) // Цвет при при нажатии
        backgroundColor = .blue
    }
    
    // Обязательный инициализатор
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
