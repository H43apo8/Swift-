//
//  ThemeViewController.swift
//  myProject
//
//  Created by Максим Бобков on 25.01.2024.
//

import UIKit

final class ThemeViewController: UIViewController {
    
    private lazy var buttonWhite: UIButton = {
        let button = UIButton()
        button.backgroundColor = WhiteTheme().backgroundColor
        button.layer.borderWidth = 1
        button.layer.borderColor = UIColor.gray.cgColor
        button.addTarget(self, action: #selector(tapWhite), for: .touchUpInside)
        return button
    }()
    
    private lazy var buttonBlue: UIButton = {
        let button = UIButton()
        button.backgroundColor = BlueTheme().backgroundColor
        button.layer.borderWidth = 1
        button.layer.borderColor = UIColor.gray.cgColor
        button.addTarget(self, action: #selector(tapBlue), for: .touchUpInside)
        return button
    }()
    
    private lazy var buttonGreen: UIButton = {
        let button = UIButton()
        button.backgroundColor = GreenTheme().backgroundColor
        button.layer.borderWidth = 1
        button.layer.borderColor = UIColor.gray.cgColor
        button.addTarget(self, action: #selector(tapGreen), for: .touchUpInside)
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = Theme.currentTheme.backgroundColor
        
        setupUI()
        setupConstraints()
    }
    
    func setupUI() {
        
        view.addSubview(buttonWhite)
        view.addSubview(buttonBlue)
        view.addSubview(buttonGreen)
    }
    
    func setupConstraints() {
        
        buttonWhite.translatesAutoresizingMaskIntoConstraints = false
        buttonBlue.translatesAutoresizingMaskIntoConstraints = false
        buttonGreen.translatesAutoresizingMaskIntoConstraints = false
        
        let buttonWidth = view.frame.size.width / 2
        let buttonHeight: CGFloat = 50
        
        NSLayoutConstraint.activate([
            
            buttonWhite.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            buttonWhite.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            buttonWhite.widthAnchor.constraint(equalToConstant: buttonWidth),
            buttonWhite.heightAnchor.constraint(equalToConstant: buttonHeight),
            
            buttonBlue.topAnchor.constraint(equalTo: buttonWhite.bottomAnchor, constant: 20),
            buttonBlue.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            buttonBlue.widthAnchor.constraint(equalToConstant: buttonWidth),
            buttonBlue.heightAnchor.constraint(equalToConstant: buttonHeight),
            
            buttonGreen.topAnchor.constraint(equalTo: buttonBlue.bottomAnchor, constant: 20),
            buttonGreen.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            buttonGreen.widthAnchor.constraint(equalToConstant: buttonWidth),
            buttonGreen.heightAnchor.constraint(equalToConstant: buttonHeight),
        ])
    }
}


// MARK: objc methods

// Создаём расширение для выноса всех objc-методов, чтобы лучше ориентироваться по коду
private extension ThemeViewController {
    
    @objc func tapWhite() {
        Theme.currentTheme = WhiteTheme()
        view.backgroundColor = Theme.currentTheme.backgroundColor
    }

    @objc func tapBlue() {
        Theme.currentTheme = BlueTheme()
        view.backgroundColor = Theme.currentTheme.backgroundColor
    }
    
    @objc func tapGreen() {
        Theme.currentTheme = GreenTheme()
        view.backgroundColor = Theme.currentTheme.backgroundColor
    }
}
